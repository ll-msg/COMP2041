from ssl import RAND_add


def read_dna(dna_file):
    """
    Read a DNA string from a file.
    the file contains data in the following format:
    A <-> T
    G <-> C
    G <-> C
    C <-> G
    G <-> C
    T <-> A
    Output a list of touples:
    [
        ('A', 'T'),
        ('G', 'C'),
        ('G', 'C'),
        ('C', 'G'),
        ('G', 'C'),
        ('T', 'A'),
    ]
    Where either (or both) elements in the string might be missing:
    <-> T
    G <->
    G <-> C
    <->
    <-> C
    T <-> A
    Output:
    [
        ('', 'T'),
        ('G', ''),
        ('G', 'C'),
        ('', ''),
        ('', 'C'),
        ('T', 'A'),
    ]
    """
    output = []
    with open(dna_file, "r") as f:
        for dna_line in f:
            dna_line = dna_line.split("<->")
            output_tuple = (dna_line[0].strip(), dna_line[1].strip())
            output.append(output_tuple)
    return output

def is_rna(dna):
    """
    Given DNA in the aforementioned format,
    return the string "DNA" if the data is DNA,
    return the string "RNA" if the data is RNA,
    return the string "Invalid" if the data is neither DNA nor RNA.
    DNA consists of the following bases:
    Adenine  ('A'),
    Thymine  ('T'),
    Guanine  ('G'),
    Cytosine ('C'),
    RNA consists of the following bases:
    Adenine  ('A'),
    Uracil   ('U'),
    Guanine  ('G'),
    Cytosine ('C'),
    The data is DNA if at least 90% of the bases are one of the DNA bases.
    The data is RNA if at least 90% of the bases are one of the RNA bases.
    The data is invalid if more than 10% of the bases are not one of the DNA or RNA bases.
    Empty bases should be ignored.
    """
    dna_num = 0
    rna_num = 0
    total = 0

    dna_list = ['A', 'T', 'G', 'C']
    rna_list = ['A', 'U', 'G', 'C']

    for data in dna:
        if (data[0] in dna_list):
            dna_num += 1
        if (data[0] in rna_list):
            rna_num += 1
        
        if (data[1] in dna_list):
            dna_num += 1
        if (data[1] in rna_list):
            rna_num += 1

        total += 2
    
    dna_p = float(dna_num) / float(total)
    rna_p = float(rna_num) / float(total)
    
    if (dna_p >= 0.9):
        return "DNA"
    elif (rna_p >= 0.9):
        return "RNA"
    else:
        return "Invalid"


def clean_dna(dna):
    """
    Given DNA in the aforementioned format,
    If the pair is incomplete, ('A', '') or ('', 'G'), ect
    Fill in the missing base with the match base.
    In DNA 'A' matches with 'T', 'G' matches with 'C'
    In RNA 'A' matches with 'U', 'G' matches with 'C'
    If a pair contains an invalid base the pair should be removed.
    Pairs of empty bases should be ignored.
    """
    rna = is_rna(dna)
    new_dna = []
    valid_lst = ['A', 'T', 'U', 'G', 'C']

    for data in dna:
        '''if ((data[0] not in valid_lst) or (data[1] not in valid_lst)):
            continue'''
        
        if (data[1] == ''):
            if (data[0] == 'A'):
                if (rna) == "DNA":
                    new_tuple = ('A', 'T')
                    new_dna.append(new_tuple)
                elif (rna == "RNA"):
                    new_tuple = ('A', 'U')
                    new_dna.append(new_tuple)
            elif (data[0] == 'T'):
                new_tuple = ('T', 'A')
                new_dna.append(new_tuple)
            elif (data[0] == 'U'):
                new_tuple = ('U', 'A')
                new_dna.append(new_tuple)
            elif (data[0] == 'G'):
                new_tuple = ('G', 'C')
                new_dna.append(new_tuple)
            elif (data[0] == 'C'):
                new_tuple = ('C', 'G')
                new_dna.append(new_tuple)
        elif (data[0] == ''):
            if (data[1] == 'A'):
                if (rna == "DNA"):
                    new_tuple = ('T', 'A')
                    new_dna.append(new_tuple)
                elif (rna == "RNA"):
                    new_tuple = ('U', 'A')
                    new_dna.append(new_tuple)
            elif (data[1] == 'T'):
                new_tuple = ('A', 'T')
                new_dna.append(new_tuple)
            elif (data[1] == 'U'):
                new_tuple = ('A', 'U')
                new_dna.append(new_tuple)
            elif (data[1] == 'G'):
                new_tuple = ('C', 'G')
                new_dna.append(new_tuple)
            elif (data[1] == 'C'):
                new_tuple = ('G', 'C')
                new_dna.append(new_tuple)
        else:
            new_dna.append(data)
 
    return new_dna

def mast_common_base(dna):
    """
    Given DNA in the aforementioned format,
    return the most common first base:
    eg. given:
    A <-> T
    G <-> C
    G <-> C
    C <-> G
    G <-> C
    T <-> A
    The most common first base is 'G'.
    Empty bases should be ignored.
    """
    first = []
    for data in dna:
        first.append(data[0])
    
    return max(set(first), key=first.count)

def base_to_name(base):
    """
    Given a base, return the name of the base.
    The base names are:
    Adenine  ('A'),
    Thymine  ('T'),
    Guanine  ('G'),
    Cytosine ('C'),
    Uracil   ('U'),
    return the string "Unknown" if the base isn't one of the above.
    """
    if base == 'A':
        return "Adenine"
    elif base == 'T':
        return "Thymine"
    elif base == 'G':
        return "Guanine"
    elif base == 'C':
        return "Cytosine"
    elif base == 'U':
        return "Uracil"
    else:
        return "Unknown"
