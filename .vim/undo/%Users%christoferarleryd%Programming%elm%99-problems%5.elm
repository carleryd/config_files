Vim�UnDo� p�
�s�JJ�:��D�Ěn4H�����k����      &    text (toString (myReverse [1..4]))                             X��    _�                             ����                                                                                                                                                                                                                                                                                                                                                             X��     �                   �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             X��     �      	          -- your implementation goes here5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             X��     �               
        in5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             X��     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             X��     �         
       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             X��     �         
          let5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                             X��     �         
      myReverse la =5�_�      	                 	    ����                                                                                                                                                                                                                                                                                                                                                             X��     �      	   
      	    case 5�_�      
           	   
        ����                                                                                                                                                                                                                                                                                                                                                             X��    �   	   
           5�_�   	              
      
    ����                                                                                                                                                                                                                                                                                                                                                             X��     �      	         %        (x:xs) -> myReverse xs ++ [x]5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                             X��    �                  import Html exposing (text)   import List        myReverse: List a -> List a   myReverse list =       case list of           [] -> []   &        (x::xs) -> myReverse xs ++ [x]       main =   $  text (toString (myReverse [1..4]))5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             X�     �                &    text (toString (myReverse [1..4]))5�_�                       )    ����                                                                                                                                                                                                                                                                                                                                                             X�     �                 ,    text (toString (myReverse List.range 0))5�_�                       *    ����                                                                                                                                                                                                                                                                                                                                                             X�     �                 ,    text (toString (myReverse List.range 1))5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             X�#     �                 .    text (toString (myReverse List.range 1 4))5�_�                       -    ����                                                                                                                                                                                                                                                                                                                                                             X�%    �                 /    text (toString (myReverse (List.range 1 4))5�_�                       ,    ����                                                                                                                                                                                                                                                                                                                                                             X��     �                 0    text (toString (myReverse (List.range 1 4)))5�_�                       ,    ����                                                                                                                                                                                                                                                                                                                                                             X��     �                 0    text (toString (myReverse (List.range 1 5)))5�_�                       ,    ����                                                                                                                                                                                                                                                                                                                                                             X��     �                 0    text (toString (myReverse (List.range 1 6)))5�_�                        ,    ����                                                                                                                                                                                                                                                                                                                                                             X��    �                 0    text (toString (myReverse (List.range 1 7)))5��