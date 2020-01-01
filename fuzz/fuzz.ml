open Crowbar

let () =
  add_test ~name:"create" [bytes] (fun a ->
    (* Parse \n as this is a known deviation of behaviour *)
    let a = Str.(global_replace (regexp_string "\n") a "") in
    let x = try Uri.(of_string a |> to_string) with _ -> "" in
    let y = try Uri_legacy.(of_string a |> to_string) with _ -> "" in
    check_eq ~pp:pp_string x y
  )
