
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<link href="../prism.css" rel="stylesheet" />
<link href="../style.css" rel="stylesheet" />
<script src="../prism.js"></script>
<div class="container">
    <div class="row" data-masonry='{"percentPosition": true }'>
        <div class="col col-12 col-lg-6 px-1 mb-2 valeurtypevariable">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Types de base</h3>
                    <div class="card-text">
                        <table class="table100">
                            <tr>
                                <td class="type"> int </td>
                                <td class="valeur">783 0 -192 <span data-bracket="binaire">0b010</span> <span
                                        data-bracket="hexa">0xF3</span></td>
                            </tr>
                            <tr>
                                <td class="type">float</td>
                                <td class="valeur">9.23 0.0 -1.7<span data-bracket="x10^(-6)">e-6</span></td>
                            </tr>
                            <tr>
                                <td class="type">bool</td>
                                <td class="valeurspe">True False</td>
                            </tr>
                            <tr>
                                <td class="type"><span class="adroite" data-bracket="immutables">str</span></td>
                                <td class="valeur">
                                    <table class="table100">
                                        <tr>
                                            <td>"Hello world"</td>
                                            <td class="center">"Un<span class="agauche"
                                                    data-bracket="retour à la ligne">\n</span>Deux"</td>
                                        </tr>
                                        <tr>
                                            <td>"""chaine sur <br>
                                                plusieurs<span
                                                    data-bracket="tabulation">\t</span>lignes"""</span>
                                            </td>
                                            <td class="center">
                                                &nbsp;&nbsp;&nbsp;"L<span data-bracket="' échappée">\'</span>âme"
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="type">NoneType</td>
                                <td class="valeurspe">None</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 liste">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Types conteneurs</h3>
                    <div class="card-text">
                        <table class="table100">
                            <tr>
                                <td>séquences ordonnées, accès par index rapide, valeurs répétables</td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="table100">
                                        <tr>
                                            <td class="type w-25">list</td>
                                            <td class="valeur w-25">[1, 5, 3]</td>
                                            <td class="valeur w-25">["x", 8.9]</td>
                                            <td class="valeur w-25">["mot"]</td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="valeur">
                                    []
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="table100">
                                        <tr>
                                            <td class="type w-25">tuple</td>
                                            <td class="valeur w-25">(1, 5, 3)</td>
                                            <td class="valeur w-25"><span
                                                    data-bracket="expression juste avec des virgules">11,
                                                    "y"</span></td>
                                            <td class="valeur w-25">("mot",)</td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="valeur">
                                    ()
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="table100">
                                        <tr>
                                            <td class="type w-25">str</td>
                                            <td>séquences ordonnées de caractères</td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="valeur">""</td>
                            </tr>
                            <tr>
                                <td>conteneurs clés, sans ordre a priori, accès par clé rapide, chaque clé unique
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="table100 dictionnaire">
                                        <tr>
                                            <td class="type w-25">dict</td>
                                            <td class="valeur">{<span
                                                    data-bracket="valeurs hachables (types base, immutables...)">"clé"</span>:"val"}</td>
                                            <td class="valeur px-2">dict(("clé","val"))</td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="valeur">
                                    {}
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 valeurtypevariable">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Identificateurs</h3>
                    <div class="card-text">
                        <p>pour noms de variables, fonctions, modules, classes…</p>
                        <p><span class="variable">a…zA…Z_</span> suivi de <span class="variable">a…zA…Z_0…9</span>
                        </p>
                        <ul>
                            <li>accents possibles mais à éviter</li>
                            <li>mots clés du langage interdits</li>
                            <li>distinction casse min/MAJ</li>
                        </ul>
                        <table class="table100 variable">
                            <tr>
                                <td>😀</td>
                                <td>a</td>
                                <td>toto</td>
                                <td>x7</td>
                                <td>y_max</td>
                                <td>BigOne</td>
                            </tr>
                            <tr>
                                <td>😞</td>
                                <td class="text-decoration-line-through">8y</td>
                                <td class="text-decoration-line-through">and</td>
                                <td class="text-decoration-line-through">for</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 valeurtypevariable">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Variables et affectations</h3>
                    <div class="card-text">
                        <p>affectations ⇔ association d'un nom à une valeur</p>
                        <ol>
                            <li>évaluation de la valeur de l'expression de droite</li>
                            <li>affectation dans l'ordre avec les noms de gauche</li>
                        </ol>
                        <table class="">
                            <tr>
                                <td width="200px"><span class="variable">x</span> = <span class="valeur">1.2</span> + <span
                                        class="valeur">8</span></td>
                                <td>affectation simple</td>
                            </tr>
                            <tr>
                                <td><span class="variable">y</span> , <span class="variable">z</span> , <span
                                        class="variable">r</span> = <span class="valeur">9.2</span> , <span
                                        class="valeur">-7.6</span> , <span class="valeur">0</span></td>
                                <td>affectation multiple</td>
                            </tr>
                            <tr>
                                <td><span class="variable">a</span> , <span class="variable">b</span> = <span
                                        class="variable">b</span> , <span class="variable">a</span></td>
                                <td>échange de valeurs</td>
                            </tr>
                            <tr>
                                <td><span class="variable">x</span> += <span class="valeur">3</span></td>
                                <td>incrémentation ⇔ <span class="variable">x</span> = <span
                                        class="variable">x</span> +
                                    <span class="valeur">3</span>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="variable">x</span> -= <span class="valeur">2</span></td>
                                <td>décrémentation ⇔ <span class="variable">x</span> = <span
                                        class="variable">x</span> -
                                    <span class="valeur">2</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>  
        </div> 
        <div class="col col-12 col-lg-6 px-1 mb-2 valeurtypevariable">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Conversion</h3>
                    <div class="card-text">
                        <p>en général: <span class="type">type</span>(expression)</p>
                        <table class="">
                            <tr>
                                <td colspan="2"><span class="type">int</span>(<span class="valeur">"15"</span>) →
                                    <span class="valeur">15</span></td>
                            </tr>
                            <tr>
                                <td width="200px"><span class="type">int</span>(<span class="valeur">"3f"</span>, <span
                                        class="valeur">"16"</span>) → <span class="valeur">63</span></td>
                                <td>spécification de la base du nombre entier en 2nd paramètre</td>
                            </tr>
                            <tr>
                                <td><span class="type">int</span>(<span class="valeur">15.56</span>) → <span
                                        class="valeur">15</span></td>
                                <td>troncature de la partie décimale</td>
                            </tr>
                            <tr>
                                <td colspan="2"><span class="type">float</span>(<span
                                        class="valeur">"-11.24e8"</span>)
                                    → <span class="valeur">-1124000000.0</span></td>
                            </tr>
                            <tr>
                                <td><span class="type">round</span>(<span class="valeur">15.56</span>, <span
                                        class="valeur">1</span>) → <span class="valeur">15.6</span></td>
                                <td>arrondi à 1 décimale (0 décimale → nb entier)</td>
                            </tr>
                            <tr>
                                <td><span class="type">bool</span>(<span class="variable">x</span>)</td>
                                <td><span class="valeurspe">False</span> pour <span class="variable">x</span> zéro,
                                    conteneur vide, None ou False ; <span class="valeurspe">True</span> pour autres
                                    <span class="variable">x</span>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="type">str</span>(<span class="variable">x</span>) → <span
                                        class="valeur">"..."</span></td>
                                <td>chaîne de représentation de <span class="variable">x</span> pour l'affichage
                                    (cf.
                                    Formatage au verso)</td>
                            </tr>
                            <tr>
                                <td><span class="type">chr</span>(<span class="valeur">64</span>) → <span
                                        class="valeur">'@'</span> </td>
                                <td rowspan="2">code ↔ caractère</td>
                            </tr>
                            <tr>
                                <td><span class="type">ord</span>(<span class="valeur">'@'</span>) → <span
                                        class="valeur">64</span></td>
                            </tr>
                            <tr class="liste">
                                <td colspan="2"><span class="type">list</span>(<span class="valeur">"abc"</span>) →
                                    <span class="valeur">['a', 'b', 'c']</span>
                                </td>
                            </tr>
                            <tr class="dictionnaire">
                                <td colspan="2"><span class="type">dict</span>(<span
                                        class="valeur">[(3,"trois"),(1,"un")]</span>) → <span
                                        class="valeur">{1:'un',3:'trois'}</span></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 conditionnelle">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Logique booléenne</h3>
                    <div class="card-text">
                        <table class="text-center">
                            <tr>
                                <td class="p-1">Comparateurs</td><td class="p-1">&lt;</td><td class="p-1">&gt;</td><td class="p-1">&lt;=</td><td class="p-1">&gt;=</td><td class="p-1">==</td><td class="p-1">!=</td>
                            </tr>
                            <tr class="small">
                                <td colspan="3" class="fst-italic">(résultats booléens)</td><td class="p-1">&leq;</td><td class="p-1">&geq;</td><td class="p-1">=</td><td class="p-1">&ne;</td>
                            </tr>
                        </table>
                        <table class="table100">
                            <tr>
                                <td width="150px"><span class="variable">a</span> <span class="type">and</span> <span class="variable">b</span></td><td>et logique <span class="fst-italic small">(les deux en même temps)</span></td>
                            </tr>
                            <tr>
                                <td><span class="variable">a</span> <span class="type">or</span> <span class="variable">b</span></td><td>ou logique <span class="fst-italic small">(l'un ou l'autre ou les deux)</span></td>
                            </tr>
                            <tr>
                                <td colspan="2">⇒ s'assurer que <span class="variable">a</span> et <span class="variable">b</span> sont booléens.</td>
                            </tr>
                            <tr>
                                <td><span class="type">not</span> <span class="variable">a</span></td><td>non logique </td>
                            </tr>
                            <tr>
                                <td><span class="valeurspe">True / False</span></td><td>constantes Vrai/Faux</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 liste">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Indexation conteneurs séquences</h3>
                    <div class="card-text">
                        <p>pour les listes, tuples, chaînes de caractères...</p>
                        <div class="col-12">
                            <table class="text-center">
                                <tr>
                                    <td>index négatif</td><td></td><td>-5</td><td></td><td>-4</td><td></td><td>-3</td><td></td><td>-2</td><td></td><td>-1</td><td></td>
                                </tr>
                                <tr>
                                    <td>index positif</td><td></td><td>0</td><td></td><td>1</td><td></td><td>2</td><td></td><td>3</td><td></td><td>4</td><td></td>
                                </tr>
                                <tr>
                                    <td><span class="variable">lst</span> =</td><td>[</td><td class="valeur">10</td><td>,</td><td class="valeur">20</td><td>,</td><td class="valeur">30</td><td>,</td><td class="valeur">40</td><td>,</td><td class="valeur">50</td><td>]</td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-12">
                            <p class="fw-bold">nombre d'éléments</p>
                            <p><span class="fonction">len</span>(<span class="variable">lst</span>) → <span class="valeur">5</span></p>
                            <p class="fw-bold">⚠ index à partir de 0</p>
                            <p class="fst-italic">(de 0 à 4 ici)</p>
                        </div>
                        <div class="col-12">
                            <p><span class="fw-bold">Accès</span> individuel aux éléments par <span class="variable">lst[<span class="fst-italic">index</span>]</span></p>
                            <div class="row m-0">
                                <div class="col">
                                    <p><span class="variable">lst</span>[<span class="valeur">0</span>]→<span class="valeur">10</span></p>
                                    <p><span class="variable">lst</span>[<span class="valeur">-1</span>]→<span class="valeur">50</span></p> 
                                </div>
                                <div class="col">
                                    <p>⇒ le premier</p>
                                    <p>⇒ le dernier</p>
                                </div>
                                <div class="col">
                                    <p><span class="variable">lst</span>[<span class="valeur">1</span>]→<span class="valeur">20</span></p>
                                    <p><span class="variable">lst</span>[<span class="valeur">-2</span>]→<span class="valeur">40</span></p> 
                                </div>
                            </div>
                            <p>Sur les séquences modifiables (list), la <span class="fw-bold">modification</span> se fait par affectation : <span class="variable">lst</span>[<span class="valeur">4</span>] = <span class="valeur">25</span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 chapfonction">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Blocs d'instruction</h3>
                    <div class="card-text">
                        <img src="../data/blocs.svg" alt="" class="card-img-top ">
                        <p>⚠ régler l'éditeur pour insérer 4 espaces à la place d'une tabulation d'indentation.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 chapfonction">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Imports modules/noms</h3>
                    <div class="card-text">
                        <p><span class="fst-italic">module</span> <span class="module">truc</span> ⇔ <span class="fst-italic">fichier</span> truc.py</p>
                        <p><span class="type">from</span> <span class="module">monmod</span> <span class="type">import</span> <span class="fonction">nom1</span>, <span class="fonction">nom2</span> <span class="type">as</span> <span class="fonction">fct</span>
                        <span class="fst-italic text-end">→accès direct aux noms (renommage possible avec <span class="type">as</span>)</span></p>
                        <p><span class="type">import</span> <span class="module">monmod</span> <span class="fst-italic">→accès via <span class="module">monmod</span>.<span class="fonction">nom1</span> …</span></p>
                        <p>☝ modules et packages cherchés dans le python path (cf. sys.path)</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 conditionnelle">
            <div class="card">
            <div class="card-body">
                <div class="row m-0 card-title">
                    <div class="col col-8"><h3>Instructions conditionnelles</h3></div>
                    <div class="col col-4"><img width="100%" src="../data/conditionnelle.png" alt=""></div>
                </div>
                <div class="card-text">
                <p><span class="fst-italic">un bloc d'instructions est exécuté uniquement si sa condition est vraie</span></p>
                <p><span class="type">if</span> <span class="variable">condition logique</span>:</p>
                <p><span data-bracket="         ⚠ tabulation">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> bloc d'instructions</p>
                <p class="mt-1"><span class="fst-italic">seul ou combinable avec des sinon (<span  class="type">else</span>) et sinon si (<span  class="type">elif</span>). Seul le bloc de la première condition trouvée vraie est exécuté.</span> </p>
                <hr class="my-0 mx-2">
                <p><span class="type">if </span><span class="variable">age</span> &lt;= <span class="valeur">18</span> :</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="variable">etat</span> = <span class="valeur">"Enfant"</span></p>
                <p><span class="type">elif </span><span class="variable">age</span> &lt; <span class="valeur">65</span> :</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="variable">etat</span> = <span class="valeur">"Retraité"</span></p>
                <p><span class="type">else </span>:</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="variable">etat</span> = <span class="valeur">"Actif"</span></p>
            </div>
            </div>
        </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 valeurtypevariable">
            <div class="card">
            <div class="card-body">
                <h3 class="h3 card-title">
                    Maths
                </h3>
                <div class="card-text">
                    <table class="table100"><tr>
                        <td class="p-1" style="width:25%">Opérateurs :</td><td> +</td><td> -</td><td> <span data-bracket="✕">*</span></td><td> <span data-bracket="÷">/</span></td><td> <span data-bracket="entière">//</span></td><td> <span data-bracket="reste">%</span></td><td> <span data-bracket="puissance">**</span></td>
                    </tr></table>
                <p class="mt-1 fst-italic">☝ priorités usuelles, utilisation conseillée des parenthèses</p>
                <p><span class="valeur">1</span> + <span class="valeur">5.3</span> * <span class="valeur">2</span> → <span class="valeur">11.6</span></p>
                <p><span class="type">abs</span>(<span class="valeur">-3.2</span>) → <span class="valeur">3.2</span></p>
                <p><span class="type">round</span>(<span class="valeur">3.57</span>, <span class="valeur">1</span>) → <span class="valeur">3.6</span></p>
                <p><span class="type">pow</span>(<span class="valeur">4</span>, <span class="valeur">3</span>) → <span class="valeur">64.0</span></p>
                <p><span class="valeur">1.1</span> + <span class="valeur">1.1</span> + <span class="valeur">1.1</span> → <span class="valeur">3.3000000000000003</span></p>
                <p class="mt-1 fst-italic">☝ nombres flottants… valeurs approchées !</p>
                <p><span class="type">from</span> <span class="module">math</span> <span class="type">import</span> <span class="fonction">sin</span>, <span class="fonction">pi</span>, ...</p>
                <p><span class="type">sin</span>(<span class="valeur">pi</span>/<span class="valeur">4</span>) → <span class="valeur">0.707</span>…</p>
                <p><span class="type">cos</span>(<span class="valeur">2</span>*<span class="valeur">pi</span>/<span class="valeur">3</span>) → <span class="valeur">-0.4999</span>…</p>
                <p><span class="type">sqrt</span>(<span class="valeur">81</span>) → <span class="valeur">9.0</span> &nbsp;&nbsp; &radic;</p>
                <p><span class="type">log</span>(<span class="valeur">e</span>**<span class="valeur">2</span>) → <span class="valeur">2.0</span></p>
                <p><span class="type">ceil</span>(<span class="valeur">12.5</span>) → <span class="valeur">13</span></p>
                <p><span class="type">floor</span>(<span class="valeur">12.5</span>) → <span class="valeur">12</span></p>
                <p>modules <span class="module">math</span>, <span class="module">statistics</span>, <span class="module">random</span>, <span class="module">decimal</span>, <span class="module">fractions</span>, <span class="module">numpy</span>, etc.</p>
            </div>
            </div>
        </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 conditionnelle">
            <div class="card">
            <div class="card-body">
                <div class="row m-0 card-title">
                    <div class="col col-8"><h3>Instruction boucle conditionnelle</h3></div>
                    <div class="col col-4"><img width="50%" src="../data/boucleconditionnelle.png" alt=""></div>
                </div>
                <div class="card-text">
                <p><span class="fst-italic">bloc d'instructions exécuté <span class="fw-bold">tant que</span> la condition est vraie</span></p>
                <p><span class="type">while</span> <span class="variable">condition logique</span>:</p>
                <p><span data-bracket="         ⚠ tabulation">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> bloc d'instructions</p>
                <p class="lead mt-2 text-center">⚠ Attention aux boucles sans fin !</p>
                <hr class="my-0 mx-2">
                <table class="table100">
                    <tr>
                        <td><p><span class="variable">s</span> = <span class="valeur">0</span> </p>
                            <span class="variable">i</span> = <span class="valeur">1</span> </td>
                            <td class="fst-italic" rowspan="2">
                                <p>initialisations avant la boucle</p>
                                <p class="mt-3">condition avec au moins une valeur variable (ici i)</p>
                            </td>
                            <td class="fst-italic" rowspan="3">
                                <p class="small">Algo de :</p>
                                <p class="lead">
                                <math display="block" class="tml-display" style="display:block math;">
                                    <mrow>
                                        <mi>s</mi>
                                        <mo>=</mo>
                                        <mrow>
                                        <munderover>
                                            <mo movablelimits="false">∑</mo>
                                            <mrow>
                                            <mi>i</mi>
                                            <mo>=</mo>
                                            <mn>1</mn>
                                            </mrow>
                                            <mrow>
                                            <mi>i</mi>
                                            <mo>=</mo>
                                            <mn>100</mn>
                                            </mrow>
                                        </munderover>
                                        </mrow>
                                        <msup>
                                        <mi>i</mi>
                                        <mn>2</mn>
                                        </msup>
                                    </mrow>
                                </math>
                                </p>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="type">while </span><span class="variable">i</span> &lt;= <span class="valeur">100</span> :</td>
                    </tr>
                    <tr>
                        <td width="140px"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="variable">s</span> = <span class="variable">s</span> + <span class="variable">i</span> ** <span class="valeur">2</span></p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="variable">i</span> = <span class="variable">i</span> + <span class="valeur">1</span></p>
                        </td>
                        <td class="fst-italic">☝ faire varier la variable de condition !</td>
                    </tr>
                    <tr>
                        <td colspan="2"><span class="fonction">print</span>(<span class="valeur">"somme :"</span>, <span class="variable">s</span>)</td>
                    </tr>
                </table>
            </div>
            </div>
        </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 boucle">
            <div class="card">
            <div class="card-body">
                <div class="row m-0 card-title">
                    <div class="col col-8"><h3>Instruction boucle itérative</h3></div>
                    <div class="col col-4"><img width="50%" src="../data/boucle.png" alt=""></div>
                </div>
                <div class="card-text">
                <p><span class="fst-italic">bloc d'instructions exécuté <span class="fw-bold">pour chaque</span> élément d'un conteneur ou d'un itérateur</span></p>
                <p><span class="type">for</span> <span class="variable">var</span> <span class="type">in</span> <span class="variable">sequence</span>:</p>
                <p><span data-bracket="         ⚠ tabulation">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> bloc d'instructions</p>
                <p class="lead mt-2 text-center">⚠ Bonne habitude : ne pas modifier la variable de boucle </p>
                <hr class="my-0 mx-2">
                <p>Parcours des <span class="fw-bold">valeurs</span> d'un conteneur</p>
                <table class="table100">
                    <tr>
                        <td><p><span class="variable">s</span> = <span class="valeur">"Du texte"</span> </p>
                            <span class="variable">cpt</span> = <span class="valeur">0</span> </td><td class="fst-italic">initialisations avant la boucle</td>
                    </tr>
                    <tr>
                        <td><span class="type">for</span> <span class="variable">c</span> <span class="type">in</span> <span class="variable">s</span>:</td><td class="fst-italic" rowspan="2"><span class="variable">c</span> est variable de boucle, <span class="fw-bold">affectation gérée</span> par le <span class="type">for</span></td>
                    </tr>
                    <tr>
                        <td width="230px"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="type">if</span> <span class="variable">c</span> == <span class="variable">"e"</span></p></td>
                    </tr>
                    <tr>  
                        <td>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="variable">cpt</span> = <span class="variable">cpt</span> + <span class="valeur">1</span></p>
                        <p><span class="fonction">print</span>(<span class="valeur">"trouvé"</span>, <span class="variable">cpt</span>, <span class="valeur">"'e'"</span>)</p></td><td class="fst-italic px-3">Algo de: comptage du nombre de <span class="fst-normal">e</span> dans la chaine</td>
                    </tr>
                </table>
                <hr class="my-0 mx-2">
                <p>Parcours des <span class="fw-bold">index</span> d'un conteneur séquence</p>
                <p>    ◽ changement de l'élément à la position</p>
                <p>    ◽ accès aux éléments autour de la position (avant/après)</p>
                <table class="table100">
                    <tr>
                        <td width="300px">
                            <p><span class="variable">lst</span> = [<span class="valeur">-1</span>,<span class="valeur">18</span>,<span class="valeur">-4</span>,<span class="valeur">12</span>,<span class="valeur">-7</span>,<span class="valeur">0</span>,<span class="valeur">17</span>]</p>
                            <p><span class="type">for</span> <span class="variable">idx</span> <span class="type">in</span> <span class="fonction">range</span>(<span class="fonction">len</span>(<span class="variable">lst</span>)):</p>
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="type">if</span> <span class="variable">lst</span>[<span class="variable">idx</span>] &lt; <span class="valeur">0</span> :</p>
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="variable">lst</span>[<span class="variable">idx</span>] = <span class="valeur">0</span></p>
                        </td>
                        <td class="fst-italic">Algo de : bornage des valeurs négatives</td>
                    </tr>
                </table>
                <hr class="my-0 mx-2">
                <p>Parcours simultané index et valeurs de la séquence :</p>
                <p><span class="type">for</span> <span class="variable">idx</span>,<span class="variable"> val</span> <span class="type">in</span> <span class="fonction">enumerate</span>(<span class="variable">lst</span>) :</p>
            </div>
            </div>
        </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 valeurtypevariable">
            <div class="card">
            <div class="card-body">
                <h3 class="card-title">Affichage</h3>
                <div class="card-text">
                    <table class="text-center">
                        <tr>
                            <td><span class="fonction">print</span>(</td><td><span class="valeur">"v="</span> , </td><td><span class="valeur">3</span> , </td><td><span class="variable">x</span> , </td><td><span class="variable">y</span> + <span class="valeur">2</span></td><td>)</td>
                        </tr>
                        <tr>
                            <td></td><td>&#x2B61;</td><td>&#x2B61;</td><td>&#x2B61;</td><td>&#x2B61;</td><td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2" class="fst-italic px-2">valeurs (tout type)</td>
                            <td class="fst-italic px-2">vatiables</td>
                            <td class="fst-italic px-2"> expressions</td>
                        </tr>
                    </table>
                    <p>Options de <span class="fonction">print</span>:</p>
                    <table class="table100">
                        <tr>
                            <td width="200px">◽ <span class="variable">sep</span> = <span class="valeur">" "</span></td>
                            <td class="px-2">séparateur d'éléments, défaut espace</td>
                        </tr>
                        <tr>
                            <td>◽ <span class="variable">end</span> = <span class="valeur">"\n"</span></td>
                            <td class="px-2">fin d'affichage, défaut fin de ligne</td>
                        </tr>
                        <tr>
                            <td>◽ <span class="variable">file</span> = <span class="type">sys</span>.<span class="variable">stdout</span></td>
                            <td class="px-2">print vers fichier, défaut sortie standard</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 valeurtypevariable">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Saisie</h3>
                    <div class="card-text">
                        <p><span class="valeur">s</span> = <span class="fonction">input</span>(<span class="valeur">"Directives:"</span> )</p>
                        <p>☝ <span class="fonction">input</span> retourne toujours une <span class="fw-bold">chaîne</span>, la convertir vers le type désiré
                            (cf. encadré Conversions).</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 liste">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Opérations génériques sur les conteneurs</h3>
                    <div class="card-text">
                        <table class="table100">
                            <tr>
                                <td><p><span class="fonction">len</span>(<span class="variable">c</span>)→ nb d'éléments</p></td><td rowspan="2" class="px-2 fst-italic">Note: Pour dictionnaires et ensembles, ces opérations travaillent sur les clés.</td>
                            </tr>
                            <tr>
                                <td width="200px"><p><span class="fonction">min</span>(<span class="variable">c</span>) <span class="fonction">max</span>(<span class="variable">c</span>) <span class="fonction">sum</span>(<span class="variable">c</span>)</p></td>
                            </tr>
                        </table>
                        <p><span class="valeur">val</span> <span class="type">in</span> <span class="variable">c</span> → booléen, opérateur <span class="type">in</span> de test de présence (<span class="type">not in</span> d'absence)</p>
                        <p><span class="fonction">enumerate</span>(<span class="variable">c</span>)→ itérateur sur (index, valeur)</p>
                        <p><span class="fonction">zip</span>(<span class="variable">c1</span>,<span class="variable">c2</span>…)→ itérateur sur tuples contenant les éléments de même index des <span class="variable">c<sub>i</sub></span></p>
                        <p><span class="variable">c</span>.<span class="fonction">clear</span>() supprime le contenu des dictionnaires, ensembles, listes</p>
                        <hr class="my-0 mx-2">
                        <p>Spécifique aux conteneurs de séquences ordonnées (listes, tuples, chaînes, bytes…)</p>
                        <p><span class="fonction">reversed</span>(<span class="variable">c</span>)→ itérateur inversé</p>
                        <table class="w-100">
                            <tr>
                                <td><span class="variable">c</span> * 5 → duplication</td>
                                <td><span class="variable">c</span> + <span class="variable">c2</span> → concaténation</td>
                            </tr>
                        </table>
                        <p><span class="fonction">sorted</span>(<span class="variable">c</span>)→ list copie triée</p>
                        <p><span class="variable">c</span>.<span class="fonction">index</span>(<span class="valeur">val</span>)→ position</p>
                        <p><span class="variable">c</span>.<span class="fonction">count</span>(<span class="valeur">val</span>)→ nb d'occurences</p>
                        <hr class="my-0 mx-2">
                        <p><span class="type">import</span> <span class="module">copy</span></p>
                        <p><span class="module">copy</span>.<span class="fonction">copy</span>(<span class="variable">c</span>)→ copie superficielle du conteneur</p>
                        <p><span class="module">copy</span>.<span class="fonction">deepcopy</span>(<span class="variable">c</span>)→ copie en profondeur du conteneur</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 chapfonction">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Définition de fonction</h3>
                    <div class="card-text">
                        <table class="table100">
                        <tr><td colspan="2" class="fst-italic">nom de la fonction (identificateur)</td><td width="33%"></td></tr>
                        <tr><td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#x2b63;</td><td width="33%"></td></tr>
                        <tr><td width="33%"><span class="motcle">def</span> <span class="fonction">fct</span>(<span class="variable">x</span>,<span class="variable">y</span>,<span class="variable">z</span>):</td><td class="fst-italic" colspan="2">&#x2b60; <span class="variable">x</span>,<span class="variable">y</span> et <span class="variable">z</span> sont des paramètres nommés</td></tr>
                            <tr><td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="valeur">"""documentation"""</span></td></tr>
                            <tr><td colspan="2" class="fw-bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# bloc instructions, calcul de res, etc.</td></tr>
                            <tr><td class="align-top"><span data-bracket="         ⚠ tabulation">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="motcle">return</span> <span class="variable">res</span></td><td colspan="2" class="fst-italic">&#x2b60; valeur résultat de l'appel, si pas de résultat
                                calculé à retourner : return None</td></tr>
                        </table>
                        <p>☝ les paramètres et toutes les variables de ce bloc n'existent que dans le bloc et pendant l'appel à la fonction (penser “boîte noire”)</p>                               
                    </div>
                </div>
            </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 chapfonction">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Appel de fonction</h3>
                    <div class="card-text">
                        <table class="">
                        <tr><td width="100px"></td><td><span class="variable">r</span> = </td><td><span class="fonction">fct</span>(</td><td><span class="valeur">3</span>, <span class="variable">i</span> + <span class="valeur">2</span>, <span class="valeur">2</span> * <span class="variable">i</span></td><td>)</td></tr>
                        <tr><td></td><td class="text-center">&#x2b61;</td><td></td><td class="text-center">&#x2b61;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
                        <tr><td colspan="3" class="fst-italic">stockage/utilisation <br> de la valeur de retour</td><td class="fst-italic" colspan="2">une valeur d'argument <br> par paramètre</td></tr>
                        </table>
                        <p>☝ c'est l'utilisation du nom de la fonction avec les parenthèses qui fait l'appel</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 liste">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Opérations sur les listes</h3>
                    <div class="card-text">
                        <p class="">☝ modification de la liste originale</p>
                        <table class="table100">
                            <tr><td><span class="variable">lst</span>.<span class="fonction">append</span>(<span class="variable">val</span>)</td>
                            <td>ajout d'un élément à la fin</td></tr>
                            <tr><td><span class="variable">lst</span>.<span class="fonction">extend</span>(<span class="variable">seq</span>)</td>
                            <td>ajout d'une séquence d'éléments à la fin</td></tr>
                            <tr><td><span class="variable">lst</span>.<span class="fonction">insert</span>(<span class="variable">idx</span>,<span class="variable">val</span>)</td>
                            <td>insertion d'un élément à une position</td></tr>
                            <tr><td><span class="variable">lst</span>.<span class="fonction">remove</span>(<span class="variable">val</span>)</td>
                            <td>suppression du premier élément de valeur val</td></tr>
                            <tr><td class="pe-2"><span class="variable">lst</span>.<span class="fonction">pop</span>([<span class="variable">idx</span>])→valeur</td>
                            <td>supp. & retourne l'item d'index idx (défaut le dernier)</td></tr>
                            <tr><td><span class="variable">lst</span>.<span class="fonction">sort</span>() <span class="variable">lst</span>.<span class="fonction">reverse</span>() <td>tri / inversion de la liste sur place</td></tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 dictionnaire">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Opérations sur les dictionnaires</h3>
                    <div class="card-text">
                        <p class="">☝ modification du dictionnaire original</p>
                        <table class="table100">
                            <tr><td><span class="variable">d</span>[<span class="variable">clé</span>] = <span class="variable">valeur</span></td><td>reaffectation ou création d'une clé</td></tr>
                            <tr><td><span class="variable">d</span>[<span class="variable">clé</span>] → valeur</td><td>récupération de la valeur d'une clé</td></tr>
                            <tr><td><span class="variable">d</span>.<span class="fonction">update</span>(<span class="variable">d2</span>)</td>
                            <td>mise à jour/ajout des couple de d2 à d</td></tr>
                            <tr><td><span class="variable">d</span>.<span class="fonction">keys</span>()</td>
                            <td class="" rowspan="3"> → vues itérables sur clés / valeurs '/ couples </td></tr>
                            <tr><td><span class="variable">d</span>.<span class="fonction">values</span>()</td>
                            </tr>
                            <tr><td><span class="variable">d</span>.<span class="fonction">items</span>()</td>
                            </tr>
                            <tr><td class="pe-2"><span class="variable">d</span>.<span class="fonction">get</span>(<span class="variable">clé</span>[,<span class="variable">default</span>])→valeur</td>
                            <td>retourne la valeur de la clé si elle existe, la valeur par defaut sinon.</td></tr>
                            <tr><td><span class="motcle">del</span> <span class="variable">d</span>[<span class="variable">clé</span>]</td><td>supprime le couple cle/valeur de d</td></tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col col-12 col-lg-6 px-1 mb-2 fichier">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Fichiers</h3>
                    <div class="card-text">
                        <p class="">stockage de données sur disque, et relecture</p>
                        <table class="table100">
                            <tr><td><span class="variable">f</span> = <span class="fonction">open</span>(</td><td><span class="valeur">"fic.txt"</span></td><td>, </td><td width="100px"><span class="valeur">"w"</span></td><td>, </td><td>encoding=</td><td><span class="valeur">"utf8"</span>)</td></tr>
                            <tr><td>⭡</td><td>&nbsp;&nbsp;&nbsp;&nbsp;⭡</td><td></td><td>&nbsp;&nbsp;⭡</td><td></td><td></td><td>&nbsp;&nbsp;⭡</td></tr>
                            <tr class="align-top"><td>variable
                                fichier pour
                                les opérations</td>
                            <td colspan="1">nom du fichier
                                sur le disque
                                (+chemin…)</td>
                            <td colspan="4">mode d'ouverture <br>
                                ◽ 'r' lecture (read)<br>
                                ◽ 'w' écriture (write)<br>
                                ◽ 'a' ajout (append)<br>
                                ◽ …'+' 'x' 'b' 't' </td>
                            <td>encodage des caractères pour les fichiers textes: utf8 ascii latin1 …</td></tr>
                        </table>
                        <hr class="my-0 mx-2">
                        <table class="table100">
                            <tr><td>en <span class="bold">écriture</span></td><td>en <span class="bold">lecture</span></td></tr>
                            <tr>
                                <td>
                                    <span class="variable">f</span>.<span class="fonction">write</span>(<span class="valeur">"coucou"</span>) <br>
                                    <span class="variable">f</span>.<span class="fonction">writelines</span>(<span class="variable fst-italic">list de lignes</span>)
                                </td>
                                <td>
                                    <p>☝ lit chaîne vide si fin de fichier</p>
                                    <p><span class="variable">f</span>.<span class="fonction">read</span>([<span class="variable">n</span>]) → n caractères suivants</p>
                                    <p class="text-center">si n non spécifié, lit jusqu'à la fin !</p>
                                    <p><span class="variable">f</span>.<span class="fonction">readlines</span>([<span class="variable">n</span>]) → list lignes suivantes</p>
                                    <p><span class="variable">f</span>.<span class="fonction">readline</span>() → ligne suivante</p>
                                </td>
                            </tr>
                        </table>
                        <p class="text-center">☝ par défaut mode texte <span class="fw-bold">t</span> (lit/écrit <span class="type">str</span>), mode binaire <span class="fw-bold">b</span> possible (lit/écrit <span class="type">bytes</span>). Convertir de/vers le type désiré !</p>
                        <p><span class="variable">f</span>.<span class="fonction">close</span>() &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ☝ ne pas oublier de refermer le fichier après son utilisation !</p>
                        <hr class="mx-2 my-0">
                        <table class="table100">
                            <tr>
                                <td width="50%">
                                    Très courant : ouverture en bloc gardé (fermeture automatique) et boucle de lecture des lignes d'un fichier texte.
                                </td>
                                <td>                                            
                                    <p><code class="language-python">with open(…) as f:</code></p>
                                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<code class="language-python">for ligne in f :</code></p>
                                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<code class="language-python"># traitement de ligne</code></p>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

