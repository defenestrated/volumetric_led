{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 3,
			"revision" : 4,
			"architecture" : "x86",
			"modernui" : 1
		}
,
		"rect" : [ 489.0, 181.0, 1157.0, 806.0 ],
		"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 401.0, 133.0, 46.0, 22.0 ],
					"style" : "",
					"text" : "s color"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 426.0, 74.0, 43.0, 22.0 ],
					"style" : "",
					"text" : "sel 32"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 4,
					"outlettype" : [ "int", "int", "int", "int" ],
					"patching_rect" : [ 398.0, 30.0, 50.5, 22.0 ],
					"style" : "",
					"text" : "key"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 361.0, 32.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 341.0, 73.0, 39.0, 22.0 ],
					"style" : "",
					"text" : "s pwr"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-66",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "face-fx.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 10.25, 159.0, 247.0, 150.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 24.25, 220.0, 247.0, 150.0 ],
					"varname" : "face-fx[1]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"items" : [ "Microsoft® LifeCam Cinema(TM) #5", ",", "FaceTime HD Camera", ",", "the Monolith II" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 14.25, 81.635254, 145.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 24.25, 137.0, 145.0, 22.0 ],
					"style" : "",
					"varname" : "umenu"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 14.25, 120.364746, 101.0, 22.0 ],
					"style" : "",
					"text" : "camera-wrangler"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-58",
					"maxclass" : "textbutton",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 101.0, 46.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 24.25, 187.0, 100.0, 20.0 ],
					"style" : "",
					"text" : "image",
					"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"texton" : "accurate",
					"textoncolor" : [ 0.439216, 0.74902, 0.254902, 1.0 ],
					"usebgoncolor" : 1,
					"varname" : "textbutton"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 101.0, 18.0, 107.0, 33.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 24.25, 165.0, 129.0, 20.0 ],
					"style" : "",
					"text" : "camera resolution (Y):"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 10.25, 325.0, 122.25, 78.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 24.25, 382.0, 122.25, 78.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-19",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 14.25, 15.0, 74.0, 23.0 ],
					"style" : "",
					"text" : "getinputlist"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-17",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 15.25, 46.0, 72.0, 23.0 ],
					"style" : "",
					"text" : "getvdevlist"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 1 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-52", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 2 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "camera-wrangler.maxpat",
				"bootpath" : "~/Active-Work/Freelance/ib5k/mc2-verizon/chandelier/volumetric_led/video-processing-WINDOWS/patchers",
				"patcherrelativepath" : "./video-processing-WINDOWS/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "face-fx.maxpat",
				"bootpath" : "~/Active-Work/Freelance/ib5k/mc2-verizon/chandelier/volumetric_led/video-processing-WINDOWS/patchers",
				"patcherrelativepath" : "./video-processing-WINDOWS/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "vdelay.maxpat",
				"bootpath" : "~/Active-Work/Freelance/ib5k/mc2-verizon/chandelier/volumetric_led/video-processing-WINDOWS/patchers",
				"patcherrelativepath" : "./video-processing-WINDOWS/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "patterific.json",
				"bootpath" : "~/Active-Work/Freelance/ib5k/mc2-verizon/chandelier/volumetric_led/video-processing-WINDOWS/data",
				"patcherrelativepath" : "./video-processing-WINDOWS/data",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
