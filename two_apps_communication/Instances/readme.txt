This demo demonstrates how an application can communicate with other
instances of itself. The InterAppSender and InterAppReceiver components
are used to ensure only one instance of an application will be
running.

It is very simple to do this by using a mutex, a semaphore, a global atom,
or something similar (see API documentation on CreateMutex and OpenMutex).

However, mutexes and such don't have an owner, only a reference count,
so you have to use FindWindow to find an already running instance,
and you can't pass information from the new to the old instance,
such as command line parameters. The InterAppComm components allow you 
to do this in a simple way.

Troels Jakobsen
delphiuser@get2net.dk

