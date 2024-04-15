import React, { useEffect } from 'react';
export default function Header(){
	useEffect(() => {
		const handleMenuClick = () => {
		  const topNav = document.querySelector('.top-nav ul');
		  if (topNav) {
			topNav.classList.toggle('slide');
		  }
		};
	
		const menuButton = document.querySelector('span.menu');
		if (menuButton) {
		  menuButton.addEventListener('click', handleMenuClick);
		}
	
		return () => {
		  if (menuButton) {
			menuButton.removeEventListener('click', handleMenuClick);
		  }
		};
	  }, []);

    return (        
<div className="header" >
	<div className="top-header" >		
		<div className="container">
		<div className="top-head" >	
			<ul className="header-in">
				<li ><a href="#" >  Help</a></li>
				<li><a href="contact.html">   Contact Us</a></li>
				<li ><a href="#" >   How To Use</a></li>
			</ul>
				<div className="search">
					<form>
						<input type="text" value="search about something ?" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'search about something ?';}" />
						<input type="submit" value="" />
					</form>
				</div>
			
				<div className="clearfix"> </div>
		</div>
		</div>
	</div>
	
		<div className="header-top">
		<div className="container">
		<div className="head-top">
			<div className="logo">
			
				<h1><a href="index.html"><span> C</span>rowd <span>F</span>unding</a></h1>
				
			</div>
		<div className="top-nav">		
			  <span className="menu"><img src="images/menu.png" alt=""/> </span>
				
					<ul>
						<li className="active"><a className="color1" href="index.html"  >Home</a></li>
						<li className="active"><a className="color2" href="#"  >Login with Google</a></li>
						<li className="active"><a className="color5" href="#"  >Login with Facebook</a></li>
						{/* <li><a className="color2" href="games.html"  >Games</a></li>
						<li><a className="color3" href="reviews.html"  >Reviews</a></li>
						<li><a className="color4" href="404.html" >404</a></li>
						<li><a className="color5" href="blog.html"  >Blog</a></li>
						<li><a className="color6" href="contact.html" >Contact</a></li> */}
						<div className="clearfix"> </div>
					</ul>

				</div>
				
				<div className="clearfix"> </div>
		</div>
		</div>
	</div>
</div>
    )
}