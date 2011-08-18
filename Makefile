#
# husk-scheme
# http://github.com/justinethier/husk-scheme
#
# Written by Justin Ethier
#
# Make file used to build husk and run test cases.
#

HUSKI = ../huski
UNIT_TEST_DIR = scm-unit-tests

# Run a "simple" build using GHC directly 
husk: hs-src/shell.hs hs-src/Language/Scheme/Core.hs hs-src/Language/Scheme/Macro.hs hs-src/Language/Scheme/Numerical.hs hs-src/Language/Scheme/Parser.hs hs-src/Language/Scheme/Types.hs hs-src/Language/Scheme/Variables.hs hs-src/Language/Scheme/Primitives.hs hs-src/Language/Scheme/Utilities.hs
	ghc -Wall --make -package parsec -package ghc -fglasgow-exts -o huski hs-src/shell.hs hs-src/Language/Scheme/Core.hs hs-src/Language/Scheme/Macro.hs hs-src/Language/Scheme/Numerical.hs hs-src/Language/Scheme/Parser.hs hs-src/Language/Scheme/Types.hs hs-src/Language/Scheme/Variables.hs Paths_husk_scheme.hs hs-src/Language/Scheme/Primitives.hs hs-src/Language/Scheme/Utilities.hs

# An experimental target to create a smaller, dynamically linked executable using GHC directly 
# See: http://stackoverflow.com/questions/699908/making-small-haskell-executables
#
husk-small: hs-src/shell.hs hs-src/Language/Scheme/Core.hs hs-src/Language/Scheme/Macro.hs hs-src/Language/Scheme/Numerical.hs hs-src/Language/Scheme/Parser.hs hs-src/Language/Scheme/Types.hs hs-src/Language/Scheme/Variables.hs hs-src/Language/Scheme/Primitives.hs hs-src/Language/Scheme/Utilities.hs
	ghc -Wall --make -package parsec -package ghc -fglasgow-exts -o huski hs-src/shell.hs hs-src/Language/Scheme/Core.hs hs-src/Language/Scheme/Macro.hs hs-src/Language/Scheme/Numerical.hs hs-src/Language/Scheme/Parser.hs hs-src/Language/Scheme/Types.hs hs-src/Language/Scheme/Variables.hs Paths_husk_scheme.hs hs-src/Language/Scheme/Primitives.hs hs-src/Language/Scheme/Utilities.hs
#	ghc -dynamic -Wall --make -package parsec -package ghc -fglasgow-exts -o huski hs-src/shell.hs hs-src/Language/Scheme/Core.hs hs-src/Language/Scheme/Macro.hs hs-src/Language/Scheme/Numerical.hs hs-src/Language/Scheme/Parser.hs hs-src/Language/Scheme/Types.hs hs-src/Language/Scheme/Variables.hs Paths_husk_scheme.hs hs-src/Language/Scheme/Primitives.hs hs-src/Language/Scheme/Utilities.hs
	strip -p --strip-unneeded --remove-section=.comment -o huski-small huski

# Create files for distribution
dist:
	runhaskell Setup.hs configure --prefix=$(HOME) --user && runhaskell Setup.hs build && runhaskell Setup.hs install && runhaskell Setup.hs sdist

# Create API documentation
doc:
	runhaskell Setup.hs haddock 

# Run all unit tests
test: husk stdlib.scm
	@echo "0" > $(UNIT_TEST_DIR)/scm-unit.tmp
	@echo "0" >> $(UNIT_TEST_DIR)/scm-unit.tmp
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-backquote.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-case.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-closure.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-cond.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-cont.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-delay.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-eval.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-exec.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-extensions.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-iteration.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-macro.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-numerical-ops.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-hashtable.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-scoping.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-special-forms.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-standard-procedures.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-stdlib.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-string.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-vector.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) t-parser.scm
	@cd $(UNIT_TEST_DIR) ; $(HUSKI) summarize.scm
	@rm -f $(UNIT_TEST_DIR)/scm-unit.tmp

# Create tag files to ease souce code browsing
tags:
	hasktags hs-src/Language/Scheme/*.hs hs-src/*.hs *.hs

# Delete all temporary files generated by a build
clean:
	rm -f huski tags TAGS
	rm -rf dist
	find . -type f -name "*.hi" -exec rm -f {} \;
	find . -type f -name "*.o" -exec rm -f {} \;
