
(defvar ac-stack-ghc-keywords
  '((candidates . (list "case" "class" "data" "default" "deriving" "else"
		       "import" "infix" "infixl" "infixr" "instance" "let" "module" "newtype" "then" "type" "where"
		       "Nothing" "qualified" "return" "undefined"))))

(defun load-dictionary (file)
  (let (dict)
    (with-temp-buffer ;一時バッファを作成
      (insert-file-contents file) ;fileの内容を挿入
      (goto-char (point-min)) ;先頭に移動
      (while (not (eobp)) ;バッファの最後でない間
	(push (buffer-substring ;現在行をdictに追加
	       (line-beginning-position)
	       (line-end-position))
	      dict)
	(forward-line 1))) ;一行下に移動
    (nreverse dict))) ;dictを反転して返す

(defvar ac-dict-path  (expand-file-name "ac-stack-ghc-dict" (file-name-directory ac-stack-ghc-dictionary-directory)))

(defvar haskell-mod-dict-cache (load-dictionary ac-dict-path))

(defvar ac-source-haskell-import
  '((candidates . haskell-mod-dict-cache)
    (prefix . "^import \\(.*\\)")))

(defvar ac-source-haskell-import-qulified
  '((candidates . haskell-mod-dict-cache)
    (prefix . "^import qualified \\(.*\\)")))

(add-hook 'stack-ghci-mode-hook
	  '(lambda ()
	     (progn
	       (add-to-list 'ac-sources 'ac-stack-ghc-keywords t)
	       (add-to-list 'ac-sources 'ac-source-haskell-import t)
	       (add-to-list 'ac-sources 'ac-source-haskell-import-qulified t))))

(provide 'ac-stack-ghc)
