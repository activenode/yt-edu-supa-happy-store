"use client";

import { useSnackbar } from "notistack";
import { getSupabaseClient } from "../utils/supabase-browser";
import { useUser } from "../utils/useUser";

type ProductProps = {
  id: number;
  name: string;
  image_path: string;
  costs: number;
};

export function Product({ id, name, image_path, costs }: ProductProps) {
  const supabase = getSupabaseClient();
  const { enqueueSnackbar, closeSnackbar } = useSnackbar();
  const { user } = useUser();

  const addToCart = async (product_id: number) => {
    const { data, error } = await supabase.from("cart_items").insert([
      {
        product: product_id,
        user: user?.id,
      },
    ]);

    if (error) {
      console.error("error", error);
      enqueueSnackbar({
        message: "Error adding to cart. Are you signed in?",
        variant: "error",
        anchorOrigin: {
          horizontal: "center",
          vertical: "top",
        },
        autoHideDuration: 2500,
      });
    }
  };

  return (
    <div className="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col">
      <div>
        <img
          className="hover:grow hover:shadow-lg w-full h-full"
          src={"/products/" + image_path}
        />
        <div className="pt-3 flex items-center justify-between">
          <p>{name}</p>

          <div className="flex items-center">
            <div>
              <button
                className="ml-2 flex items-center gap-3 border bg-slate-100 hover:scale-95 hover:bg-blue-100 transition-all text-black font-bold py-2 px-2 rounded"
                onClick={() => {
                  addToCart(id);
                }}
              >
                <svg
                  className="fill-current hover:text-black hover:scale-125 transition-all"
                  xmlns="http://www.w3.org/2000/svg"
                  width={24}
                  height={24}
                  viewBox="0 0 24 24"
                >
                  <path d="M21,7H7.462L5.91,3.586C5.748,3.229,5.392,3,5,3H2v2h2.356L9.09,15.414C9.252,15.771,9.608,16,10,16h8 c0.4,0,0.762-0.238,0.919-0.606l3-7c0.133-0.309,0.101-0.663-0.084-0.944C21.649,7.169,21.336,7,21,7z M17.341,14h-6.697L8.371,9 h11.112L17.341,14z" />
                  <circle cx="10.5" cy="18.5" r="1.5" />
                  <circle cx="17.5" cy="18.5" r="1.5" />
                </svg>
                +
              </button>
            </div>
          </div>
        </div>
        <p className="pt-1 text-gray-900">
          {(costs / 100).toLocaleString("en-US", {
            style: "currency",
            currency: "USD",
          })}
        </p>
      </div>
    </div>
  );
}
