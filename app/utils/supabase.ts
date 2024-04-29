import { createServerClient } from "@supabase/ssr";
import { cookies } from "next/headers";

export function supabaseServerClient() {
  const cookieStore = cookies();

  // normally you need a middleware as well to handle the cookies
  // see: https://supabase.com/docs/guides/auth/server-side/creating-a-client?environment=middleware
  // i didn't do it because i use the client functions to show the store stuff :)
  // if it seems like something isn't showing, just refresh the page
  return createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        get: (name) => cookieStore.get(name)?.value,
        set: (name, value, options) => {
          try {
            cookieStore.set({
              name,
              value,
              ...options,
            });
          } catch (e) {}
        },
        remove: (name, options) => {
          try {
            cookieStore.set({
              name,
              value: "",
              ...options,
            });
          } catch (e) {}
        },
      },
    }
  );
}
