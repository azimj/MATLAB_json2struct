function final_struct = mergestruct(struct1,struct2)
%MERGED_STRUCT=MERGESTRUCT(STRUCT_1,STRUCT_2) Update values in first 
%struct, STRUCT_1, with values on in second struct, STRUCT_2
%
%Loops over fields in struct2 and updates values in struct1
%returning an updated struct1.


%Azim Jinha
%2021-05-31


flds = fieldnames(struct2)';

final_struct = struct1;
for f=flds
    final_struct.(f{1}) = struct2.(f{1});
end

src(1) ="s1";
if isfield(struct1,'source')
    src(1)=string(struct1.source);
end

src(2)="s2";
if isfield(struct2,'source')
     src(2)=string(struct2.source);
end
final_struct.source=char(src.join('->'));

end

