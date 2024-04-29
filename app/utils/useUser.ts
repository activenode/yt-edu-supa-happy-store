import { useEffect, useState } from "react";
import { getSupabaseClient } from "./supabase-browser";
import { User } from "@supabase/supabase-js";

const supabase = getSupabaseClient();

const subscribers = new Set<
  (user: User | null, isAnonymous: boolean) => void
>();

supabase.auth.onAuthStateChange((event, session) => {
  console.log("@onAuthStateChange", event, session);
  if (session?.user) {
    subscribers.forEach((callback) =>
      callback(session.user, session.user.is_anonymous === true)
    );
  } else {
    subscribers.forEach((callback) => callback(null, true));
  }
});

export function useUser() {
  const [isReady, setIsReady] = useState(false);
  // --> not ready before first onAuthStateChange -> must at least be INITIAL_SESSION
  const [user, setUser] = useState<User | null>(null);
  const [isAnonymous, setIsAnonymous] = useState(true);

  useEffect(() => {
    subscribers.add((user, isAnonymous) => {
      setIsReady(true);
      setUser(user);
      setIsAnonymous(isAnonymous);
    });
  }, []);

  return { user, isAnonymous, isReady };
}
