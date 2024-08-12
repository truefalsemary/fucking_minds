
user=$POSTGRES_USER
db=$POSTGRES_DB
version=$DB_VERSION

echo "Creating db with name \'$db\' from user: \'$user\'"

# psql -U "$user" -d postgres -c "create database $db"


# Choosing version
if [ -z "$version" ]
then
  version="1.0.0"
fi


# Creating user-db-creator
creator_user="creator"
psql -U "$user" -d "$db" -c "create user $creator_user password 'creator'" -c "grant create on schema public to $creator_user" -c "alter user $creator_user with superuser" 


echo $(pwd)
# Starting migrations from his name
flag="0"
for version_directory in $( find /docker-entrypoint-initdb.d/migrations -maxdepth 1 -type d | sort); do
    echo "$version_directory was found"
    if [[ $version_directory == "/docker-entrypoint-initdb.d/migrations/$version" ]]
    then
      flag="1"
    fi
    if [[ -d "$version_directory" && $version_directory != "/docker-entrypoint-initdb.d/migrations" ]]
    then
      for script in $( find "$version_directory" -maxdepth 1 -type f | sort); do
        psql -U "$creator_user" -d "$db" -f "$script"
      done
        echo "Migrations from $version_directory completed"
    fi
    if [[ $flag == "1" ]]
    then
      break
    fi
done


if [[ $flag != "1" ]]
then
  echo "Directory with such version was not found, used latest one"
else
  echo "All migrations completed"
fi

