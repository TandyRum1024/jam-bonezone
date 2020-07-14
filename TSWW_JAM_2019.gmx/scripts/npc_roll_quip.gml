randomize();

// set keywords value
targetItem = instance_nearest(x, y, oITEM);
var _itemx = 0, _itemy = 0;
var _itemname = "", _k_itempos = "";

if (targetItem == noone)
{
    type = npcTYPE.MISC;
}
else
{
    _itemx = targetItem.gridX;
    _itemy = targetItem.gridY;
    _itemname = targetItem.name;
    _k_itempos = "[X : " + string(_itemx) + ", Y : " + string(_itemy) + "]";
}

// build list of quips
var _idx = 0;
quipsMisc = -1;
quipsMisc[_idx++] = "I might have no mouth,#But at least I can#lick some icecreams..";
quipsMisc[_idx++] = "I am in inevitable cycle of suffering. Can't wait until this ends, And go surfing with my pet air.";
quipsMisc[_idx++] = "Have you ever heard of LIFE 2.0?#I heard that it's in development.. I can wait!";
quipsMisc[_idx++] = "Welcome to Hell 2.0... The future is now.";
quipsMisc[_idx++] = "Welp. Looks like I had died.#At least the music down here is good.";
quipsMisc[_idx++] = "There's an urban legend about the forbidden HYPERNUTS in hell..#They say if you find 424242 of them, Then you can undo your death?? IDK.";
quipsMisc[_idx++] = "I do believe I am dead";
quipsMisc[_idx++] = "(I have no mouth)";
quipsMisc[_idx++] = "Hello there, Would you like to sign my DAMN petition? No?#Ok...";
quipsMisc[_idx++] = "After all those years being dead, I finally forgot how to breathe.";
quipsMisc[_idx++] = "EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE";
quipsMisc[_idx++] = "Brother, It seems like you're DEAD.#BUT if you take a lick of my signature Jerry's snake oil[tm], You'll become UNDEAD for a 1 nanoseconds!";

_idx = 0;
quipsItem = -1;
quipsItem[_idx++] = "Yo, I've seen some [" + _itemname + "] lying around here..#The last place I've seen it was here : " + _k_itempos + "#Go check it out!";
quipsItem[_idx++] = "Hey. While I was walking around this place,#I remember seeing [" + _itemname + "] on " + _k_itempos + "...#Whatever you do with it is up to you.";
quipsItem[_idx++] = "What, You're looking for [" + _itemname + "]? No problem, I think that thing's around " + _k_itempos + "#Why not just go there & pick it up?#I don't need it because I'm.. dead anyways.";
quipsItem[_idx++] = "Hey, I noticed the [" + _itemname + "] at " + _k_itempos + "...#Please pick :DD";
quipsItem[_idx++] = "G'day sir, It seems that I have found [" + _itemname + "] lying around at " + _k_itempos + ".. But as you see, I have no arms that is suitable for holding stuffs..#So can you get rid of that for me?";

switch (type)
{
    case npcTYPE.MISC:
        quipBank = quipsMisc;
        break;
        
    case npcTYPE.LOCATE_ITEM:
        quipBank = quipsItem;
        break;
}

quipCurrent = quipBank[irandom_range(0, array_length_1d(quipBank) - 1)];
