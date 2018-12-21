# ChebyshevPolyfit #

Approximate functions by polynomials:
- <pre>exp(x),    0<=x<=1, deg=6</pre>
- <pre>ln(1+x),   0<=x<=1, deg=6</pre>
- <pre>sin(x)/x, -1<=x<=1, deg=8</pre>
- <pre>cos(x),   -1<=x<=1, deg=8</pre>

## `exp(x)` ##
Coefficients for `exp(x)` on the `[0, 1]` interval:

|       Coefficient      |            Term            |
|------------------------|:--------------------------:|
| `+0.00181258334235528` | <code>x<sup>6</sup></code> |
| `+0.0080200206419458`  | <code>x<sup>5</sup></code> |
| `+0.0419670793931914`  | <code>x<sup>4</sup></code> |
| `+0.166391821690428`   | <code>x<sup>3</sup></code> |
| `+0.500099940056635`   | <code>x<sup>2</sup></code> |
| `+0.999987610323461`   | `x`                        |
| `+1.00000138583625`    | `1`                        |

Maximum error on that interval: `1.387174778327080e-06`


## `ln(1+x)` ##
Coefficients for `ln(1+x)` on the `[0, 1]` interval:

|        Coefficient       |            Term            |
|--------------------------|:--------------------------:|
| `-0.0312013789893733`    | <code>x<sup>6</sup></code> |
| `+0.101964634786825`     | <code>x<sup>5</sup></code> |
| `-0.187255939165997`     | <code>x<sup>4</sup></code> |
| `+0.30301542826567`      | <code>x<sup>3</sup></code> |
| `-0.492957605179448`     | <code>x<sup>2</sup></code> |
| `+0.999422879211686`     | `x`                        |
| `+0.0000811859400770467` | `1`                        |

Maximum error on that interval: `8.121660103074230e-05`


## `sin(x)/x` ##
Coefficients for `sin(x)/x` on the `[-1, 1]` interval:

|       Coefficient        |            Term            |
|--------------------------|:--------------------------:|
| `+0.00000269375975765659`| <code>x<sup>8</sup></code> |
| `-0.000198358664086584`  | <code>x<sup>6</sup></code> |
| `+0.00833331406945632`   | <code>x<sup>4</sup></code> |
| `-0.166666664261236`     | <code>x<sup>2</sup></code> |
| `+0.999999999951925`     | `1`                        |

Maximum error on that interval: `4.805667042378870e-11`


## `cos(x)` ##
Coefficients for `cos(x)` on the `[-1, 1]` interval:

|       Coefficient       |            Term            |
|-------------------------|:--------------------------:|
| `+0.0000241212010831705`| <code>x<sup>8</sup></code> |
| `-0.00138829603431855`  | <code>x<sup>6</sup></code> |
| `+0.0416664553753419`   | <code>x<sup>4</sup></code> |
| `-0.499999973621718`    | <code>x<sup>2</sup></code> |
| `+0.999999999472876`    | `1`                        |

Maximum error on that interval: `5.271243440664400e-10`

![ChebyshevWithoutSpecCorrection.png](images/ChebyshevWithoutSpecCorrection.png)
![ChebyshevWithSpecCorrection.png](images/ChebyshevWithSpecCorrection.png)
![ChebyshevIntegral.png](images/ChebyshevIntegral.png)
