Vim�UnDo� �عE+e��$-�i�׆�knU����J,D���N              %                       X�K�    _�                            ����                                                                                                                                                                                                                                                                                                                                                             X�KL     �                   �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             X�KN     �                -- your implementation goes here5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       X�Kv     �             �             �                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       X�K{     �               !                (x', n) :: xs' ->5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       X�K}     �                                (y, n) :: xs' ->5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       X�K     �               #                    if x == x' then5�_�      	                 &    ����                                                                                                                                                                                                                                                                                                                               &          (       v   (    X�K�     �               )                        (x, n + 1) :: xs'5�_�      
           	      &    ����                                                                                                                                                                                                                                                                                                                               &          '       v   '    X�K�     �               (                        (x, n + 1) :: s'5�_�   	              
      %    ����                                                                                                                                                                                                                                                                                                                               &          %       v   %    X�K�     �               2                        ( x, 1 ) :: (x', n) :: xs'5�_�   
                    .    ����                                                                                                                                                                                                                                                                                                                               .          0       v   0    X�K�     �               1                        ( x, 1 ) :: (y, n) :: xs'5�_�                             ����                                                                                                                                                                                                                                                                                                                               .          0       v   0    X�K�    �                  import Html exposing (text)   import List       )runLengthEncode : List a -> List (a, Int)   runLengthEncode list =       case list of           [] -> []           [ x ] -> [ (x, 1) ]           x :: xs ->   &            case runLengthEncode xs of                   [] -> []                   (y, n) :: ys ->   "                    if x == y then   (                        (x, n + 1) :: ys                       else   0                        ( x, 1 ) :: (y, n) :: ys       main = text <| toString <|   <  runLengthEncode [1, 1, 1, 2, 3, 3, 3, 4, 4, 4, 4, 5, 6, 6]5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             X�KH     �                 mport Html exposing (text)   import List       )runLengthEncode : List a -> List (a, Int)    -- your implementation goes here       main = text <| toString <|   <  runLengthEncode [1, 1, 1, 2, 3, 3, 3, 4, 4, 4, 4, 5, 6, 6]5��