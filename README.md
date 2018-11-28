
# cucumber-parallel
Exercise to prove parallel execution with cucumber

Maven plugin configuration.
```xml
    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>2.18.1</version>
                <configuration>
                    <parallel>methods</parallel>
                    <threadCount>2</threadCount>
                    <perCoreThreadCount>false</perCoreThreadCount>
                    <forkCount>2</forkCount>
                </configuration>
            </plugin>
        </plugins>
    </build>
```
Important bits:
* threadCount = forkCount - this is to ensure a JVM is created per each thread
* perCoreThreadCount = to avoid surprises on multi-core processors 

=======

Test Repo

To Run :   
mvn clean test -DTest="tagname"
>>>>>>> refs/remotes/origin/master
