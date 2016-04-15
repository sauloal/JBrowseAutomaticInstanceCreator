### 01. Clone repository
 ```bash
git clone git@github.com:sauloal/JBroseAutomaticInstanceCreator.git
 ```

### 02. create and edit ```<PROJECT_NAME>.cfg```

### 03. create a project folder as defined in the ```.cfg``` file

 ```mkdir <PROJECT_NAME>```

### 04. inside the project folder create folders: 

 ``` ref ```  fasta file as defined in ```<PROJECT_NAME>.cfg```

 ``` bam ```  *.bam

 ``` gff ```  *.gff *.gff3 *.gff.gz *.gff3.gz

 ``` vcf ```  *.vcf  *.vcf.gz

  **you can create subfolders**
  
  e.g.: 
  
    ``` gff/data1 ``` - creating the category ``` Annotation ``` and track ``` data1 ```


    ``` gff/new/data1 ``` - creating the category ``` Annotation ``` and track ``` new - data1 ```


    ``` gff/assembly/data1 ``` - creating the category ``` Annotation ``` and track ``` assembly - data1 ```


### 05. inside each folder place the desired files and their indexes

  bai to bam (data1.bam and data1.bam.bai)

  tbi to vcf (data1.vcf and data1.vcf.tbi or data1.vcf.gz and data1.vcf.gz.tbi)

### 06. optionally, create a ```.nfo``` file for each data file with a pretty name.

  e.g.: for ```data1.vcf.gz``` create ```data1.vcf.gz.nfo``` containing the sample label (e.g.: Miraculous sample 1) **without new lines at the end of the line**
  
### 07. run
 ``` ./run.sh ```
  This will:
    - once
      + index and convert the reference fasta
      + index and convert the gff file
    - every time
      + symlink the indexed fasta data
      + symlink the indexed gff data
      + crete .conf file for JBrowse with all the data found

## The tree should look like this:
```bash
run.sh
fix_perm.sh
data/
data/config.sh
data/run.scr
data/gen_reg.scr
data/\<PROJECT_NAME\>.cfg
data/\<PROJECT_NAME\>/
data/\<PROJECT_NAME\>/ref/<REFERENCE>.fa
data/\<PROJECT_NAME\>/bam/
data/\<PROJECT_NAME\>/bam/data1.bam
data/\<PROJECT_NAME\>/bam/data1.bam.bai
data/\<PROJECT_NAME\>/bam/data1.bam.nfo
data/\<PROJECT_NAME\>/gff/
data/\<PROJECT_NAME\>/gff/annotation/data1.gff
data/\<PROJECT_NAME\>/gff/annotation/data1.gff.nfo
data/\<PROJECT_NAME\>/gff/annotation/data1.gff3
data/\<PROJECT_NAME\>/gff/annotation/data1.gff3.nfo
data/\<PROJECT_NAME\>/gff/assembly/data1.gff
data/\<PROJECT_NAME\>/gff/assembly/data1.gff.nfo
data/\<PROJECT_NAME\>/gff/assembly/data1.gff3
data/\<PROJECT_NAME\>/gff/assembly/data1.gff3.nfo
data/\<PROJECT_NAME\>/vcf/
data/\<PROJECT_NAME\>/vcf/data1.vcf
data/\<PROJECT_NAME\>/vcf/data1.vcf.tbi
data/\<PROJECT_NAME\>/vcf/data1.vcf.nfo
```
