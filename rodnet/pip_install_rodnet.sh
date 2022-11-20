#!/bin/bash

conda activate rodnet && [ [ python -c "import rodnet" ] || [ cd /home/RODNet && pip install -e . ] ]
