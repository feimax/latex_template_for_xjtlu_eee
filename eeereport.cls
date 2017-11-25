\ProvidesClass{eeereport}[2017/11/25 EEE Report Template]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{times}{\def\@eee@times{}}
\DeclareOption{sans}{\def\@eee@sans{}}
\DeclareOption{hardcopy}{\def\@eee@hardcopy{}}
\DeclareOption{editing}{\def\@eee@editing{}}
\DeclareOption{heading}{\def\@eee@heading{}}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{book}%
}
\ProcessOptions\relax
\LoadClass{book}
\RequirePackage[height=235mm,width=140mm,a4paper,hmargin=30mm,includemp=false]{geometry}

\ifdefined\@eee@heading
    \RequirePackage{fancyhdr}
    \pagestyle{fancy}
    \headheight = 13.6pt
\else
    \pagestyle{plain}
\fi

\ifdefined\@eee@times
    \RequirePackage{times}
\fi
\ifdefined\@eee@sans
    \renewcommand{\familydefault}{\sfdefault}
\fi

\RequirePackage{graphicx}
\RequirePackage{makeidx}
\RequirePackage{listings}
\RequirePackage{pstricks}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{epstopdf}
\RequirePackage{psfig}
\RequirePackage{url}
\RequirePackage{epsfig,graphics,subfigure,psfrag,amssymb}
\RequirePackage{float}
\RequirePackage{algpseudocode}  
\RequirePackage{algorithm}
\RequirePackage{amsmath}  
\RequirePackage{multirow}
\RequirePackage{array}


\renewcommand{\figurename}{Fig.}

\renewcommand{\bibname}{Reference}

\renewcommand{\arraystretch}{1.8}

\newcommand{\figpdf}[3]{
\begin{figure}[htp]
\centering
\includegraphics[width={#3}]{fig/#2.pdf}
\caption{{#1}}
\label{fig:#2}
\end{figure}
}

\newcommand{\figpng}[3]{
\begin{figure*}[htp]
\centering
\includegraphics[width={#3}]{fig/#2.png}
\caption{{#1}}
\label{fig:#2}
\end{figure}
}

\newcommand{\figany}[4]{
\begin{figure}[htp]
\centering
\includegraphics[width={#4}]{fig/#2.#3}
\caption{{#1}}
\label{fig:#2}
\end{figure}
}

\newcommand{\Fig}[1]{
Fig. \ref{fig:#1}
}

\newcommand{\fig}[1]{
Fig. \ref{fig:#1}
}

\ifdefined\@eee@hardcopy
    \newcommand{\logofile}{fig/xjtlu_logo_bw.pdf}
    %Code box setup
    \lstset{
        columns=fixed,       
        numbers=left, 
        frame=single,
        backgroundcolor=\color[RGB]{255,255,255},
        keywordstyle=\color[RGB]{0,0,0}\textbf,
        numberstyle=\footnotesize\color{darkgray},
        commentstyle=\it\color[RGB]{100,100,100},                % 设置代码注释的格式
        stringstyle=\ttfamily\color[RGB]{0,0,0},   % 设置字符串格式
        showstringspaces=false,                              % 不显示字符串中的空格
        basicstyle=\ttfamily，
    }
\else
    \ifdefined\@eee@editing
        \newcommand{\logofile}{fig/xjtlu_logo_white.pdf}
        \definecolor{bgcolor}{rgb}{0.20,0.23,0.27}
        \definecolor{txtcolor}{rgb}{0.70,0.70,0.70}
        \pagecolor{bgcolor}
        \color{txtcolor}
        %Code box setup
        \lstset{
            columns=fixed,       
            numbers=left, 
            frame=single,
            backgroundcolor=\color[RGB]{50,50,50},
            keywordstyle=\color[RGB]{200,200,200}\textbf,
            numberstyle=\footnotesize\color{white},
            commentstyle=\it\color[RGB]{150,150,150},                % 设置代码注释的格式
            stringstyle=\ttfamily\color[RGB]{200,120,200},   % 设置字符串格式
            showstringspaces=false,                              % 不显示字符串中的空格
            basicstyle=\ttfamily，
        }
    \else
        \newcommand{\logofile}{fig/xjtlu_logo_blue.pdf}
        %Code box setup
        \lstset{
            columns=fixed,       
            numbers=left, 
            frame=single,
            backgroundcolor=\color[RGB]{245,245,244},
            keywordstyle=\color[RGB]{40,40,255}\textbf,
            numberstyle=\footnotesize\color{darkgray},
            commentstyle=\it\color[RGB]{20,100,100},                % 设置代码注释的格式
            stringstyle=\ttfamily\color[RGB]{0,120,0},   % 设置字符串格式
            showstringspaces=false,                              % 不显示字符串中的空格
            basicstyle=\ttfamily，
        }
    \fi
\fi

\newcommand{\code}[2]{
    \lstinputlisting[language=#1]{code/#2}

}

\newcommand{\coverline}[2]{
    \Large \textbf{#1} & \Large #2 \\ \\
}

\newcommand{\covercontent}[1]{
    \newcommand{\cct}{#1}
}

\renewcommand{\title}[1]{\newcommand{\rtt}{#1}}

\newcommand{\subtitle}[1]{\newcommand{\srtt}{#1}}
\usepackage{xstring}
\newcommand{\lists}[2]{
    \IfEqCase{#1}{
        {dot}{
            \begin{itemize}
                #2
            \end{itemize}
            }
        {number}{
            \begin{enumerate}
                #2
            \end{enumerate}
            }
        }
}