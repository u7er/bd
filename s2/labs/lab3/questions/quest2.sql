-- not done

select
    group_by
    sum(decode(seq, 'abvgdee', p_count, null)) "abvgdee",
    sum(decode(seq, 'jziklmn', p_count, null)) "jziklmn",
    sum(decode(seq, 'noprstu', p_count, null)) "noprstu",
    sum(decode(seq, 'fhc4hh-', p_count, null)) "fhc4hh-",
    sum(decode(seq, '---yy', p_count, null)) "---yy"
from ranges group by seq;

