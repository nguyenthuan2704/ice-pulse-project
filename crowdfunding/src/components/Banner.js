export default function Banner (){
    return (
        <div className="banner">
        <div className="container">	
                  <div className="wmuSlider example1">
                       <div className="wmuSliderWrapper">
                     <article style={{position: 'absolute', width: '100%', opacity: '0'}}> 
                               <div className="banner-wrap">
                                <div className="banner-top">
                                    <img src="images/12.jpg" className="img-responsive" alt=""/>
                                </div>
                                  <div className="banner-top banner-bottom">
                                    <img src="images/11.jpg" className="img-responsive" alt=""/>
                                </div>
                                    <div className="clearfix"> </div>
                                </div>
                           
                    </article>
                     <article style={{position: 'absolute', width: '100%', opacity: '0'}}> 
                                   <div className="banner-wrap">
                                
                                <div className="banner-top">
                                    <img src="images/14.jpg" className="img-responsive" alt=""/>
                                </div>
                                  <div className="banner-top banner-bottom">
                                    <img src="images/13.jpg" className="img-responsive" alt=""/>
                                </div>
                                    <div className="clearfix"> </div>
                                
                                </div>
                    </article>
                     <article style={{position: 'absolute', width: '100%', opacity: '0'}}> 
                                   <div className="banner-wrap">
                                    <div className="banner-top">
                                    <img src="images/16.jpg" className="img-responsive" alt=""/>
                                </div>
                                  <div className="banner-top banner-bottom">
                                    <img src="images/15.jpg" className="img-responsive" alt=""/>
                                </div>
                                    <div className="clearfix"> </div>
                                </div>
                    </article>
                    </div>
                     <ul className="wmuSliderPagination">
                            <li><a href="#" className="">0</a></li>
                            <li><a href="#" className="">1</a></li>
                            <li><a href="#" className="wmuActive">2</a></li>
                    </ul>                                      
                </div>                                  
                
                </div>   
            </div>
    )
}