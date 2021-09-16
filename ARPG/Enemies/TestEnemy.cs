using Godot;
using System;

public class TestEnemy : Node2D
{
	int damage = 25;
	int health = 50;
	bool isCounting = true;
	int counter = 0;
	int multiples = 0;

	[Export]
	private float healthTest = 25.0f;

	[Signal]
	delegate void TestSignal();
	
	public override void _PhysicsProcess(float delta) 
	{
		if(isCounting) 
			counter += 3 * 3 * 9 / 3 * 6;
		if(counter % 10 == 0)
			multiples += 5 * 7 / 3;
		health -= 2;
		damage += 6000;
	}
	
	private void _on_Timer_timeout()
	{
		isCounting = false;
	}
}

