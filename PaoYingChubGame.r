# homework 02
# Pao Ying Chub Game

print("Welcome to Rock Paper Scissors Game!!")
print("Please enter your name: ")
user_name <- readLines("stdin", n=1)
print(paste("Hi", user_name))
print("Are you ready ?: [Y or N]")
user <- toupper(readLines("stdin", n=1))
G <- 0
while (G >= 0) {
  G = G + 1
  if (user == "Y") {
    Game <- c("R", "P", "S")
    round <- 0
    win  <- 0
    loss <- 0
    draw <- 0
    result <- c()
    while (0 <= round & round <= 4) {
      round = round + 1
      print(paste("Round", round))
      print("Please select")
      print("[R] = Rock [P] = Paper, [S] = Scissors")
      Ans <- toupper(readLines("stdin", n=1))
      Com <- sample(Game[],size = 1, replace = FALSE)
      if (Ans == Com) {
        print(paste("You choose", Ans, "and I choose", Com))
        print("Draw!!")
        draw = draw + 1
      } else if (Ans == "R" & Com == Game[3] ||
                 Ans == "P" & Com == Game[1] ||
                 Ans == "S" & Com == Game[2]) {
        print(paste("You choose", Ans, "and I choose", Com))
        print("You win!!")
        win = win + 1
      } else if (Ans == "R" & Com == Game[2] ||
                 Ans == "P" & Com == Game[3] ||
                 Ans == "S" & Com == Game[1]) {
        print(paste("You choose", Ans, "and I choose", Com))
        print("You loss!!")
        loss = loss + 1
      } else {
        print("Please try again.")
      }
    }
    df_result <- data.frame(Total_Round = round, Win = win, Draw = draw, Loss = loss)
    print(df_result)
    if (win > draw & win > loss ||
        win == draw) {
      print("You win!!")
    } else if (loss > win & loss > draw) {
      print("You loss!!")
    } else {
      print("Draw!!")
    }
    print("Do you want to play again?: ")
    print("1 Yes  2 No")
    A <- readLines("stdin", n=1)
    if (A == 1 | A == "Yes" | A == "Y" | A == "y" | A == "yes") {
      
    } else {
      print("See you next time")
      break
    }
  } else {
    print("See you next time")
    break
  }
}
