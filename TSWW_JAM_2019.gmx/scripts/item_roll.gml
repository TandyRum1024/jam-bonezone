var _type = "";

// build item name
var _idx = 0;
var namePF = -1;
namePF[_idx++] = "Curious ";
namePF[_idx++] = "Strong ";
namePF[_idx++] = "Bold ";
namePF[_idx++] = "Interesting ";
namePF[_idx++] = "Trashy ";
namePF[_idx++] = "Salute-worthy ";
namePF[_idx++] = "Ted's signature ";
namePF[_idx++] = "Jerry's ultimate ";
namePF[_idx++] = "";

_idx = 0;
var nameNoun = -1;
nameNoun[_idx++] = "seed";
nameNoun[_idx++] = "aluminum can";
nameNoun[_idx++] = "scrap paper";
nameNoun[_idx++] = "gum gunk";
nameNoun[_idx++] = "empty box";

_idx = 0;
var nameSuffix = -1;
nameSuffix[_idx++] = "";
nameSuffix[_idx++] = " of Hanover";
nameSuffix[_idx++] = " of destruction";
nameSuffix[_idx++] = " for Bill";
nameSuffix[_idx++] = " in hell";

_type = nameNoun[irandom_range(0, array_length_1d(nameNoun) - 1)];
name = namePF[irandom_range(0, array_length_1d(namePF) - 1)] + _type + nameSuffix[irandom_range(0, array_length_1d(nameSuffix) - 1)];

// build description
_idx = 0;
var descIntro = -1;
descIntro[_idx++] = "This piece of trash ";
descIntro[_idx++] = "Rolling around the depths of hell, This thing ";
descIntro[_idx++] = "This latest & innovative trash ";

_idx = 0;
var descMid = -1;
descMid[_idx++] = "is made from#Your hopes and dreams, churned together.#";
descMid[_idx++] = "is quite interesting!#";
descMid[_idx++] = "is able to communicate#with people above this hell-hole.#";
descMid[_idx++] = "is tad bit hard to#remove it from the ground...#";
descMid[_idx++] = "is looking pretty delicious...#";

_idx = 0;
var descEnd = -1;
descEnd[_idx++] = "Made for the almighty Jimbo the II, 1489.";
descEnd[_idx++] = "I must try to destroy this.";
descEnd[_idx++] = "But it's trash anyway. Into the trash can it goes.";
descEnd[_idx++] = "Damn!";
descEnd[_idx++] = "Hats off for whom brought this cursed thing#in this beautiful land.";

desc = descIntro[irandom_range(0, array_length_1d(descIntro) - 1)] + 
        descMid[irandom_range(0, array_length_1d(descMid) - 1)] +
        descEnd[irandom_range(0, array_length_1d(descEnd) - 1)];
        
// Set sprite
/*
    nameNoun[_idx++] = "seed";
    nameNoun[_idx++] = "aluminum can";
    nameNoun[_idx++] = "scrap paper";
    nameNoun[_idx++] = "gum gunk";
    nameNoun[_idx++] = "empty box";
*/
switch (_type)
{
    default:
    case "seed":
        sprite_index = sprItemSeed;
        break;
        
    case "aluminum can":
        sprite_index = sprItemCan;
        break;
        
    case "scrap paper":
        sprite_index = sprItemPaper;
        break;
        
    case "gum gunk":
        sprite_index = sprItemGum;
        break;
        
    case "empty box":
        sprite_index = sprItemBox;
        break;
}
image_index = irandom_range(0, image_number);
