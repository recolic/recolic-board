
set tk "GITLAB ACCESS TOKEN"

for line in (curl -H "PRIVATE-TOKEN: $tk" 'https://git.recolic.net/api/v4/projects/90/issues' | json2table /iid -p)
    set id (echo $line | grep -o '[0-9]*')
    echo Closing $id
    curl -X DELETE -H "PRIVATE-TOKEN: $tk" 'https://git.recolic.net/api/v4/projects/90/issues/'$id
end
