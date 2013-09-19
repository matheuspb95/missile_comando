package  
{
	/**
	 * ...
	 * @author Matheus
	 */
	public class Score 
	{
		var score:uint;
		var nome:String;
		
		public function Score(S:uint, N:String):void
		{
			score = S;
			nome = N;
		}
		public function print():String
		{
			var t:String;
			t = String(score) + ", ";
			t += nome;
			return t;
		}
	}
}