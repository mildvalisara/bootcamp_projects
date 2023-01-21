# homework 01
# chatbot
# ordering pizza

order_pizza_menu <- c()
order_pizza_size <- c()
order_pizza_price <- c()
order_pizza_quantity <- c()
order_pizza_amount <- c()
order_I_menu <- c()
order_I_size <- c()
order_I_price <- c()
order_I_quantity <- c()
order_I_amount <- c()

pizza <- c("Hawaiian", "Seafood Deluxe", "Cheese Bacon", "Double Pepperoni")
S_price <- c(239, 299, 239, 199)
M_price <- c(359, 419, 359, 299)
L_price <- c(479, 539, 479, 399)

df_pizza <- data.frame(Menu = pizza, S = S_price, M = M_price, L = L_price)

icecream <- c("Almond Fudge", "Banana Strawberry", "Cookie & Cream", "Vanilla")
mini_price <- c(239, 239, 229, 209)
quart_price <- c(369, 369, 359, 349)

df_icecream <- data.frame(Menu = icecream, Mini_Quart = mini_price, Quart = quart_price)


print("welcome to our app!")

print("Hello There!")
# question 01
print("What 's you name?: ")
user_name <- readLines("stdin", n=1)

print(paste("Hi", user_name))

# question 02

print("What do you want to order?: ")
R <- 0
while (R >= 0){
  print("1. order pizza 2. order ice cream")
  action <- readLines("stdin", n=1)
  R <- R + 1
  if (action == 1 | action == "order pizza" | action == "pizza") {
    print("You choose order pizza. This is our Menu.")
    print(df_pizza)
    # question 03
    print("What do you want to order?: ")
    print("1. Hawaiian")
    print("2. Seafood Deluxe")
    print("3. Cheese Bacon")
    print("4. Double Pepperoni")
    ID <- as.numeric(readLines("stdin", n=1))
    if (ID == 1 | ID == 2 | ID == 3 | ID == 4) {
      #question 04
      print(paste("You choose", pizza[ID], "pizza."))
      S <- 0
      while (S >= 0) {
        print("Please select size: (S-M-L)")
        size_order <- toupper(readLines("stdin", n=1))
        S <- S + 1
        if (size_order == "S") {
          price <- S_price[ID]
          print(paste("You choose", pizza[ID], "size S"))
          break
        } else {
          if (size_order == "M") {
            price <- M_price[ID]
            print(paste("You choose", pizza[ID], "size M"))
            break
          } else {
            if (size_order == "L") {
              price <- L_price[ID]
              print(paste("You choose", pizza[ID], "size L"))
              break
            } else {
              print("Please Try again!!")
            }
          }
      }  }
    }
      # question 05
  print(paste("How many", pizza[ID], "pizza do you need to order?: "))
  Q <- 0
  while (Q >= 0) {
    Q_order <- as.numeric(readLines("stdin", n=1))
    Q <- Q+1
    amount <- Q_order * price
    print(paste("You have order", Q_order, pizza[ID], "size", size_order,
                "Amount", amount))
    order_pizza_menu = c(order_pizza_menu, pizza[ID])
    order_pizza_size = c(order_pizza_size, size_order)
    order_pizza_quantity = c(order_pizza_quantity, Q_order)
    order_pizza_amount = c(order_pizza_amount, amount)
    # question 06
    print("Do you want anything else?: ")
    print("1 Yes  2 No")
    A_order <- readLines("stdin", n=1)
    if (A_order == 1 | A_order == "Yes" | A_order == "Y") {
      # question 07
      print("What do you want to order?: ")
      break
    } else {
      #order_pizza_menu = c(order_pizza_menu, pizza[ID])
      #order_pizza_size = c(order_pizza_size, size_order)
      #order_pizza_quantity = c(order_pizza_quantity, Q_order)
      #order_pizza_amount = c(order_pizza_amount, amount)
      print("This is your order")
      df_order <- data.frame(Menu = order_pizza_menu, 
                             Size = order_pizza_size, 
                             Quantity = order_pizza_quantity, 
                             Amount = order_pizza_amount 
                             )
      print(df_order)
        df_I_order <- data.frame(Menu = order_I_menu, 
                                 Size = order_I_size, 
                                 Quantity = order_I_quantity, 
                                 Amount = order_I_amount 
                                )
      if (R > 1) {
        print(df_I_order)
      }
      Total = sum(order_pizza_amount, order_I_amount)
      print(paste("Your order total is", Total, "฿"))
      #total <- sum(order_pizza_amount)
      #print(paste("Total is", total))
    }
  }
  } else {
    print("You choose order ice cream. This is our Menu.")
    print(df_icecream)
    print("What do you want to order?: ")
    print("1. Almond Fudge")
    print("2. Banana Strawberry")
    print("3. Cookie & Cream")
    print("4. Vanilla")
    I_ID <- as.numeric(readLines("stdin", n=1))
    if (I_ID ==1 | I_ID == 2 | I_ID == 3 | I_ID == 4) {
      print(paste("you choose", icecream[I_ID], "ice cream."))
      I <- 0
      while (I >=0) {
        print("Please select size: (Mini Quart [M] or Quart [Q])")
        I_size <- toupper(readLines("stdin", n=1))
        I <- I + 1
        if (I_size == "M") {
          i_price <- mini_price[I_ID]
          print(paste("You choose", icecream[I_ID], "Mini Quart."))
          break
        } else {
          i_price <- quart_price[I_ID]
          print(paste("You choose", icecream[I_ID], "Quart."))
          break
        }
      }
    }
    print(paste("How many", icecream[I_ID], "ice cream do you need to order?: "))
    I_Q <- 0
    while (I_Q >= 0) {
    I_Q_order <- as.numeric(readLines("stdin", n=1))
    I_Q <- I_Q + 1
    A <- I_Q_order * i_price
    print(paste("You have order", I_Q_order, icecream[I_ID], "Amount", A))
    order_I_menu = c(order_I_menu, icecream[I_ID])
    order_I_size = c(order_I_size, I_size)
    order_I_quantity = c(order_I_quantity, I_Q_order)
    order_I_amount = c(order_I_amount, A)
    print("Do you want anything else?: ")
    print("1 Yes  2 No")
    Add_order <- readLines("stdin", n=1)
    if (Add_order == 1 | Add_order == "Yes" | Add_order == "Y" | Add_order == "yes" |
       Add_order == "y") {
      print("What do you want to order?: ")
      break
    } else {
      print("This is your order")
      df_order <- data.frame(Menu = order_pizza_menu, 
                             Size = order_pizza_size, 
                             Quantity = order_pizza_quantity, 
                             Amount = order_pizza_amount 
                            )
      if (R > 1) {
        print(df_order)
      }
      df_I_order <- data.frame(Menu = order_I_menu, 
                               Size = order_I_size, 
                               Quantity = order_I_quantity, 
                               Amount = order_I_amount 
                              )
      print(df_I_order)
      Total = sum(order_pizza_amount, order_I_amount)
      print(paste("Your order total is", Total, "฿"))
    }
  }
  }

}
