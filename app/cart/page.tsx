"use client";

import React, { useEffect, useState } from "react";
import { Footer } from "../components/Footer";
import { getSupabaseClient } from "../utils/supabase-browser";
import { useUser } from "../utils/useUser";
import { useSnackbar } from "notistack";

export default function Cart() {
  const { user, isAnonymous } = useUser();
  const { enqueueSnackbar } = useSnackbar();

  const supabase = getSupabaseClient();
  const [cartItems, setCartItems] = useState<
    | null
    | {
        id: number;
        products: {
          name: string;
          image_path: string;
          costs: number;
        };
      }[]
  >(null);

  const refreshCart = () => {
    console.log("refreshCart");
    supabase
      .from("cart_items")
      .select("id, products(*)")
      .then(({ data, error }) => {
        if (error) {
          console.error("error", error);
        } else {
          setCartItems(data as any);
        }
      });
  };

  useEffect(() => {
    refreshCart();
  }, [user]);

  const checkout = () => {
    if (!isAnonymous) {
      enqueueSnackbar({
        message: "Will process this order soon!",
        anchorOrigin: {
          horizontal: "center",
          vertical: "top",
        },
        variant: "success",
      });
    } else {
      // do something anonymously :)
      // const email = window.prompt("Provide your mail please");
      // supabase.auth.updateUser({ email: email as string }).then(() => {
      //   enqueueSnackbar({
      //     message: "We will place your order once you confirmed your account",
      //     anchorOrigin: {
      //       horizontal: "center",
      //       vertical: "top",
      //     },
      //     variant: "info",
      //   });
      // });
    }
  };

  return (
    <React.Fragment>
      <div>
        <section className="bg-white py-8">
          <div className="container mx-auto flex items-center flex-wrap pt-4 pb-12">
            <nav id="store" className="w-full z-30 top-0 px-6 py-1">
              <div className="w-full container mx-auto flex flex-wrap items-center justify-between mt-0 px-2 py-3">
                <a
                  className="uppercase tracking-wide no-underline hover:no-underline font-bold text-gray-800 text-xl "
                  href="#"
                >
                  Your cart
                </a>
              </div>
            </nav>

            <div className="w-full p-6">
              {/* first the image, then the title, then a delete button */}
              {cartItems?.map((cartItem: any) => (
                <div
                  key={cartItem.id}
                  className="flex items-center justify-between w-full p-4 border-b"
                >
                  <div className="flex items-center">
                    <img
                      className="w-20 h-20 object-cover rounded"
                      src={"/products/" + cartItem.products.image_path}
                    />
                    <div className="ml-4">
                      <p className="text-lg font-bold">
                        {cartItem.products.name}
                      </p>
                      <p className="text-gray-500">
                        {/* //format the price in usd currency */}
                        {new Intl.NumberFormat("en-US", {
                          style: "currency",
                          currency: "USD",
                        }).format(cartItem.products.costs / 100)}
                      </p>
                    </div>
                  </div>
                  <button
                    className="text-red-500"
                    onClick={async () => {
                      await supabase
                        .from("cart_items")
                        .delete()
                        .eq("id", cartItem.id)
                        .then(refreshCart);
                    }}
                  >
                    Delete
                  </button>
                </div>
              ))}

              {/* we need to show a loading indicator if cartItems are null */}
              {cartItems === null && <p>Loading...</p>}

              {/* if the cart is empty, show a message */}
              {cartItems?.length === 0 && (
                <p className="text-lg font-bold text-center p-4 border-t">
                  Your cart is empty
                </p>
              )}

              {/* lets add a checkout where when the user is signed in, so user is not nullish,
                we show a checkout button. if the user is nullish, we show an 
                email field and a checkout button */}

              {(cartItems ?? []).length > 0 && (
                <div className="mt-4">
                  <div className="flex items-center">
                    <button
                      className="bg-blue-500 text-white font-bold py-2 px-4 rounded ml-4"
                      onClick={checkout}
                    >
                      Checkout
                    </button>
                  </div>
                </div>
              )}
            </div>
          </div>
        </section>

        <Footer />
      </div>
    </React.Fragment>
  );
}
