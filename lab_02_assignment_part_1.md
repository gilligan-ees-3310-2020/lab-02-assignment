Lab \#2 Assignment, Part 1:
================
Put your name here
Lab: Mon. Jan. 13. Due: Fri. Jan. 24

  - [Instructions](#instructions)
  - [Exercises from Chapter 3](#exercises-from-chapter-3)
      - [Worked Example for One-Layer
        Atmosphere](#worked-example-for-one-layer-atmosphere)
      - [Exercise 3.1 (Grad. students
        only)](#exercise-3.1-grad.-students-only)
      - [Exercise 3.2](#exercise-3.2)
      - [Exercise 3.3](#exercise-3.3)

"`{r setup, include=FALSE} # This section sets up some options on knitr
for processing the RMarkdown file knitr::knit_hooks$set(inline =
function(x) { knitr:::format_sci(x, 'md')}) knitr::opts_chunk$set(echo =
TRUE)`

# Instructions

Do the exercises from Chapter 3, below. You have a choice:

  - You can do the exercises out of the book like regular homework and
    turn them in at the beginning of class on Friday, Jan. 24.

  - You can do them using RMarkdown and turn them by submitting them
    electronically on GitHub before class starts on Friday, Jan. 24.
    
    To submit the homework electronically,
    
      - Accept the assignment on GitHub Classroom.
    
      - Clone a local copy of the file repository from github.
    
      - In your local repository, answer the exercises in the template
        `layer_models.Rmd`.
    
      - When you are done, knit your `.Rmd` file into a PDF or DOCX
        (Microsoft Word) file.
    
      - Use git to commit your changes (including the edits to
        `layer_models.Rmd` and the new PDF or DOCX file) to your local
        git repository.
    
      - Push the changes from your local git repository to github.
        
        The last changes that you push before the due date (start of
        class on Jan. 24) will be graded.

It is your choice how to do them. Either way is acceptable and will get
equal credit.

# Exercises from Chapter 3

  - **All students** do Chapter 3, exercises 2–3.
  - **Graduate students** should also do Chapter 3, exercise 1.

For the exercises, use the following numbers:

  - I<sub>solar</sub> = 1350 W/m<sup>2</sup>
  - \(\sigma = 5.67 \times 10^{-8}\)
  - \(\alpha = 0.30\)
  - \(\varepsilon = 1.0\)

<!-- end list -->

``` r
I_solar = 1350
alpha = 0.30
sigma = 5.67E-8
epsilon = 1
```

## Worked Example for One-Layer Atmosphere

> **A One-Layer Model.**

``` r
make_layer_diagram(1)
```

![An energy diagram for a planet with one pane of glass for an
atmosphere. The intensity of heat from visible light is
\((1 - \alpha) I_{solar} / 4\).](lab_02_assignment_part_1_files/figure-gfm/one_layer_figure-1.png)

> 1)  Write the energy budgets for the atmospheric layer, for the
>     ground, and for the Earth as a whole.

**Answer:** Start at the top, at the boundary to sapce, and work
downward:

  - At the boundary to space, \(I_{1,up} = (1 - \alpha) I_{solar} / 4\).

  - At the atmospheric layer, \(I_{1,up} + I_{1,down} = I_{ground,up}\)

  - At the ground,
    \((1 - \alpha) I_{solar} + I_{1,down} = I_{ground,up}\)

We also know that

  - \(I_{1,up} = I_{1,down} = \varepsilon \sigma T_{1}^4\)

  - \(I_{ground,up} = \sigma T_{ground}^4\)

> 2)  Manipulate the budget for the Earth as a whole to obtain the
>     temperature T<sub>1</sub> of the atmospheric layer. Does this part
>     of the exercise seem familiar in any way? Does the term ring any
>     bells?

**Answer:**

\[(1 - \alpha) I_{solar} / 4 = I_{1,up} = \sigma T_{1}^4\]

\[(1 - \alpha) I_{solar} / 4 \varepsilon \sigma = T_{1}^4\]

\[T_{1} = \sqrt[4]{\frac{(1 - \alpha) I_{solar}}{4 \varepsilon \sigma}}\]

This is familiar, because it’s the same as the formula for the bare-rock
temperature.

Here is R code to calculate \(I_{\text{1,up}}\) and \(T_1\):

``` r
I_1_up = (1 - alpha) * I_solar / 4
T_1 = (I_1_up / (epsilon * sigma))^0.25
```

From the algebraic solution, we expect T<sub>1</sub> to be 254. K. From
the R code above, we get T<sub>1</sub> = 254. K.

> 3)  Now insert the value you found for T<sub>1</sub> into the budget
>     for atmospheric layer 1 to obtain the temperature of the ground,
>     T<sub>ground</sub>.

**Answer:**

  - \(I_{ground} = I_{1,up} + I_{1,down} = 2 \times I_{1,up}\)
  - \(\varepsilon \sigma T_{ground}^4 = 2 \varepsilon \sigma T_{1}^4\)
  - \(T_{ground}^4 = 2 T_{1}^4\)
  - \(T_{ground} = \sqrt[4]{2} \times T_{1}\)

And here is R code to calculate \(I_{\text{1,down}}\),
\(I_{\text{ground}}\), and \(T_{\text{ground}}\):

``` r
I_1_down = I_1_up
I_ground = I_1_up + I_1_down
T_ground = (I_ground / (epsilon * sigma))^0.25
```

From the algebraic solution, we get T<sub>ground</sub> = 302. K and from
the R code above, we get T<sub>ground</sub> = 302. K.

## Exercise 3.1 (Grad. students only)

> **The moon with no heat transport.** The Layer Model assumes that the
> temperature of the body in space is all the same. This is not really
> very accurate, as you know that it is colder at the poles than it is
> at the equator. For a bare rock with no atmosphere or ocean, like the
> moon, the situation is even worse because fluids like air and water
> are how heat is carried around on the planet. So let us make the other
> extreme assumption, that there is no heat transport on a bare rock
> like the moon. Assume for comparability that the albedo of this world
> is 0.30, same as Earth’s.
> 
> What is the equilibrium temperature of the surface of the moon, on the
> equator, at local noon, when the sun is directly overhead? (Hint:
> First figure out the intensity of the local solar radiation
> I<sub>solar</sub>)

``` r
# Put your R code here to answer the question
```

**Answer:** put your answer here …

> What is the equilibrium temperature on the dark side of the moon?

``` r
# Put your R code here to answer the question
```

**Answer:** put your answer here …

## Exercise 3.2

> **A Two-Layer Model.** Insert another atmospheric layer into the
> model, just like the first one. The layer is transparent to visible
> light but a blackbody for infrared.

``` r
make_layer_diagram(2)
```

![An energy diagram for a planet with two panes of glass for an
atmosphere. The intensity of absorbed visible light is
\((1 - \alpha) I_{solar} / 4\).](lab_02_assignment_part_1_files/figure-gfm/two_layer_figure-1.png)

> 1)  Write the energy budgets for both atmospheric layers, for the
>     ground, and for the Earth as a whole, like we did for the
>     One-Layer Model.

**Answer:** put your energy budgets here…

> 2)  Manipulate the budget for the Earth as a whole to obtain the
>     temperature T<sub>2</sub> of the top atmospheric layer, labeled
>     Atmospheric Layer 2 in the figure above. Does this part of the
>     exercise seem familiar in any way? Does the term ring any bells?

``` r
# Put your R code here to answer the question
```

**Answer:** put the temperature T<sub>2</sub> here…

> 3)  Insert the value you found for T<sub>2</sub> into the energy
>     budget for layer 2, and solve for the temperature of layer 1 in
>     terms of layer 2. How much bigger is T<sub>1</sub> than
>     T<sub>2</sub>?

``` r
# Put your R code here to answer the question
```

**Answer:** put the temperature T<sub>1</sub> here….

> 4)  Now insert the value you found for T<sub>1</sub> into the budget
>     for atmospheric layer 1 to obtain the temperature of the ground,
>     T<sub>ground</sub>. Is the greenhouse effect stronger or weaker
>     because of the second layer?

``` r
# Put your R code here to answer the question
```

**Answer:** put your answer here…

## Exercise 3.3

``` r
make_nuclear_winter_diagram()
```

![An energy diagram for a planet with an opaque pane of glass for an
atmosphere. The intensity of absorbed visible light is
\((1 - \alpha) I_{solar} / 4\).](lab_02_assignment_part_1_files/figure-gfm/nuclear_winter_diagram-1.png)

> **Nuclear Winter.** Let us go back to the One-Layer Model but change
> it so that the atmospheric layer absorbs visible light rather than
> allowing it to pass through (See the figure above). This could happen
> if the upper atmosphere were filled with dust. For simplicity, assume
> that the albedo of the Earth remains the same, even though in the real
> world it might change with a dusty atmosphere.\> What is the
> temperature of the ground in this case?

``` r
# Put your R code here to answer this question.
```

**Answer:** put your answer here … "
