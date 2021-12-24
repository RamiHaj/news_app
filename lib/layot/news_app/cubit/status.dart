abstract class NewsStatus{}

class NewsInitialState extends NewsStatus{}

class NewsBottomNavStatus extends NewsStatus{}

class NewsBusinessSucssesStatus extends NewsStatus{}

class NewsBusinessEroorStatus extends NewsStatus
{
 final String error;

  NewsBusinessEroorStatus(this.error);
}

class NewsBussinesLoadingStatus extends NewsStatus{}

class NewsSportsSucssesStatus extends NewsStatus{}

class NewsSportsEroorStatus extends NewsStatus
{
 final String error;

 NewsSportsEroorStatus(this.error);
}

class NewsSportsLoadingStatus extends NewsStatus{}

class NewsScienceSucssesStatus extends NewsStatus{}

class NewsScienceEroorStatus extends NewsStatus
{
 final String error;

 NewsScienceEroorStatus(this.error);
}

class NewsScienceLoadingStatus extends NewsStatus{}

class NewsSearchSucssesStatus extends NewsStatus{}

class NewsSearchEroorStatus extends NewsStatus
{
 final String error;

 NewsSearchEroorStatus(this.error);
}

class NewsSearchLoadingStatus extends NewsStatus{}