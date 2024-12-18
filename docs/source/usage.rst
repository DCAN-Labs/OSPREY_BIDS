.. OSPREY_BIDS documentation master file, created by
   sphinx-quickstart on Wed Jun  5 10:48:12 2024.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Usage
=====

This page provides an example of how this application can be called, and further what the different arguments mean.
The design of the application is meant to follow general `BIDS-App guidelines <https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005209>`_.
For more details on general usage principles of BIDS-Apps, see the linked `publication  <https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005209>`_.
For more details on the overall workflow of the containerized application see the :doc:`Expected Inputs <expected_inputs>`,
:doc:`Processing Pipeline Details <processing_pipeline_details>`, and :doc:`Configuration of MRS Processing <mrs_processing_details>` sections. 

As described in the :doc:`installation <installation>` section, this tool is meant to be
interacted with in containerized form. The example below shows the
general layout for how you may want to interact with the container
to conduct processing if you have the container downloaded as a
singularity image: ::


        container_path=/path/to/container.sif
        bids_dir=/path/to/bids
        output_dir=/path/to/output
        bibsnet_dir=/path/to/bibsnet
        settings_file=/path/to/settings.json
        singularity run -B $bids_dir:/bids \
         -B $output_dir:/output \
         -B $bibsnet_dir:/bibsnet \
         -B $settings_file:/settings_file/file.json \
         $container_path /bids /output participant /settings_file/file.json

To see more specific information about how this tool expects
the inputs to be formatted (i.e. file naming conventions), 
see the :doc:`Expected Inputs <expected_inputs>` page.


Command-Line Arguments
----------------------
.. argparse::
   :ref: python_code.run.build_parser
   :prog: osprey
   :nodefaultconst:

.. toctree::
   :maxdepth: 2
   :caption: Contents: