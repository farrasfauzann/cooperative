<div class="container-fluid fixed">
		
				
		<div id="content">
		<div id="login">
			
		<?php
		$logokopindo=mysql_query("SELECT value FROM preference WHERE attr='kop_koperasi'");
		$kopindo=mysql_result($logokopindo,0);	
		$logosendiri=mysql_query("SELECT value FROM preference WHERE attr='kop_logo'");
		$sendiri=mysql_result($logosendiri,0);
		$namakoperasi=mysql_query("SELECT value FROM preference WHERE attr='kop_text'");	
		$nama=mysql_result($namakoperasi,0);
		echo "
		<table align='center'>
			<tr>
				<td><img src='../../assets/$kopindo' width='60'></td>
				<td>
					<h3>Koperasi Simpan Pinjam<br /></h3>
					<h1><b><font style='color:#71c39a'>$nama</font></b></h1>
				</td>
				<td><img src='../../assets/$sendiri' width='60'></td>
			</tr>
		</table>	";
		?>
			

	<form class="form-signin" method="post" action="login" />
		<label class="strong">Username</label>
		<input type="text" class="input-block-level" name="username" placeholder="Username" required autofocus/>
		<label class="strong">Password</label> 
		<input type="password" class="input-block-level" name="password" placeholder="Password" required/>
		
		<div class="separator line"></div> 
		<button class="btn btn-large btn-primary pull-right" type="submit">MASUK</button>
		<div class="clearfix"></div>
	</form>

	</div></div></div>