(* Função que lê um número entre min e máx -> Só aceita dentro deste intervalo *)
let rec ler min max =
  let i = read_int () 
  in 
    if i < max && i > min 
      then i 
    else 
      let () = 
        if i>=max || i<=min then 
          let () = print_string "Número fora dos limites pedidos!!"
          in print_newline () 
      in ler min max;;

(* Construção de um array de tamanho 200, em que cada casa assume o valor -1. *)
let resultados = Array.make 200 (-1);;

(*Função recursiva que procura todos os caminhos possíveis, seguindo determinadas regras
             de forma a obter uma quantia final de 42 euros.*)
let rec theansweris quantia passos pos =
  if quantia = 42 then resultados.(pos) <- passos  (* Se a quantia for 42, então é adicionado ao array resultados o número de passos feitos até então. *)
  else                                       (* Caso contrário, verifica todos os caminhos possíveis conforme um conjunto de regras predefinido, e chama novamente a função *)
    (if quantia < 42 then ()
    else                                       
      ((if (quantia mod 5 = 0) then theansweris (quantia-42) (passos+1) (pos+1));

      (if (quantia mod 3 = 0 || quantia mod 4 = 0) then
        (let frase = string_of_int (quantia) in
        let tamanho = String.length (frase) in 
        let unidades = int_of_char (String.get frase (tamanho-1)) in
        let dezenas = int_of_char (String.get frase (tamanho-2)) in
        let nova_quantia = quantia - ((unidades-48) * (dezenas-48)) in
        if nova_quantia = quantia then () else theansweris nova_quantia (passos+1) (pos+1)));
        
      (if (quantia mod 2 = 0) then theansweris (quantia - (quantia / 2)) (passos+1) (pos+1))));;
        
(* É obtida a resposta do usuário --> Número entre 0 e 1000000. *)
let n = ler 0 1000000 in
  theansweris n 0 0;;

(* É impresso no stdout o número mínimo de passos que foram feitos para chegar à quantia final desejada. 
      Caso não se tenha conseguido obter a quantia 42, a mensagem "BAD LUCK" é mostrada.*)
let () = 
  let cont = ref 0 in
  let menor = ref 100 in
  let i = ref 0 in
  while (!i != 199) do
    if resultados.(!i) != -1 && resultados.(!i) < !menor then (menor := resultados.(!i));
    if resultados.(!i) = -1 then (cont := !cont + 1);
    i := !i + 1;
  done;
  if !cont = 199 then (Printf.printf "BAD LUCK\n") else (Printf.printf "%d\n" !menor);;
  