FROM rapidsai/rapidsai:latest
WORKDIR /rapids
SHELL ["/bin/bash", "--login", "-c"]
RUN conda init bash
RUN echo "conda activate rapids" >> ~/.bashrc
RUN echo "conda activate rapids" >> ~/.bash_profile
RUN apt-get update
RUN conda update -c conda-forge -y -n base conda
RUN conda install -y -c conda-forge gensim python-graphviz cachey pyLDAvis markdown cudf modin
RUN pip install -U pip setuptools wheel
RUN pip install tensorflow
RUN pip install spacy-nightly --pre
RUN python -m spacy download en_core_web_md
RUN python -m spacy download en_core_web_trf
RUN pip install langid seaborn==0.11.0 sentence-transformers
RUN apt-get install -y python3-dev  
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN conda install -y -c conda-forge hdbscan rise
RUN pip install fastcluster umap-learn[plot] tensorboard==2.3.0
RUN pip install kaggle
EXPOSE 8888
EXPOSE 8787
EXPOSE 8686
CMD /bin/bash
# CMD ["jupyter", "notebook", ""]