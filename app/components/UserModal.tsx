"use client";

import { useEffect, useRef } from "react";
import { getSupabaseClient } from "../utils/supabase-browser";
import { useUser } from "../utils/useUser";

export function UserModal({
  children,
  show,
  onClose,
}: {
  children?: React.ReactNode;
  show: boolean;
  onClose: () => void;
}) {
  const supabase = getSupabaseClient();
  const { isAnonymous, user, isReady } = useUser();
  const isCreatingAnonUser = useRef<boolean>(false);

  useEffect(() => {
    if (isReady && !user) {
      if (isCreatingAnonUser.current) return;

      isCreatingAnonUser.current = true;
      supabase.auth
        .signInAnonymously()
        .then((result) => {
          isCreatingAnonUser.current = false;
          console.log("did");
        })
        .catch((err) => {
          console.log("could not", err);
        });
    }
  }, [isReady, user]);

  return (
    <div hidden={!show}>
      <div
        onClick={onClose}
        className="fixed inset-0 z-50 flex items-center justify-center w-full h-full bg-black bg-opacity-50"
      ></div>
      <div
        id="default-modal"
        aria-hidden="true"
        className=" overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-1/2 -translate-x-1/2  z-50 justify-center items-center w-[600px] h-[calc(100%-1rem)] max-h-full"
      >
        <div className="relative p-4 w-full max-w-2xl max-h-full">
          <div className="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <div className="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
              <h3 className="text-xl font-semibold text-gray-900 dark:text-white">
                User
              </h3>
              <button
                type="button"
                className="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
                data-modal-hide="default-modal"
                onClick={onClose}
              >
                <svg
                  className="w-3 h-3"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 14 14"
                >
                  <path
                    stroke="currentColor"
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth="2"
                    d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"
                  />
                </svg>
                <span className="sr-only">Close modal</span>
              </button>
            </div>

            <div className="p-4 md:p-5 space-y-4">
              {isAnonymous && (
                <div>
                  <div className="text-white">You&apos;re not signed in.</div>

                  {/* login form with password */}
                  <form
                    className="mt-4 flex flex-col gap-2"
                    onSubmit={(e) => {
                      e.preventDefault();
                      const form = e.target as HTMLFormElement;
                      const email = (
                        form.querySelector(
                          "input[type=email]"
                        ) as HTMLInputElement
                      ).value;
                      const password = (
                        form.querySelector(
                          "input[type=password]"
                        ) as HTMLInputElement
                      ).value;

                      const anonUserId = user?.id;
                      supabase.auth
                        .signInWithPassword({ email, password })
                        .then((data) => {
                          if (data.error) {
                            alert("Error signing in: " + data.error.message);
                          } else {
                            onClose();

                            supabase
                              .rpc("copy_anon_cart", { anon_id: anonUserId })
                              .then(() => {
                                console.log("copied items");
                              });
                          }
                        });
                    }}
                  >
                    <input
                      type="email"
                      placeholder="Email"
                      className="w-full px-3 py-2 text-xl leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline dark:bg-gray-800 dark:text-gray-200 dark:border-gray-600"
                    />
                    <input
                      type="password"
                      placeholder="Password"
                      className="w-full px-3 py-2 text-xl leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline dark:bg-gray-800 dark:text-gray-200 dark:border-gray-600"
                    />

                    <button
                      type="submit"
                      className="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                    >
                      Sign in
                    </button>
                  </form>
                </div>
              )}

              {user && !isAnonymous && (
                <div>
                  <div className="text-gray-900 dark:text-gray-100">
                    Signed in as {user.email}
                  </div>
                  <div className="text-gray-900 dark:text-gray-100">
                    User ID: {user.id}
                  </div>

                  <button
                    onClick={() => {
                      supabase.auth.signOut();
                    }}
                    className="text-white mt-4 bg-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-800"
                  >
                    Sign Out
                  </button>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
