
/* center radius (pixels) */
#define C_RADIUS 126
/* center line thickness (pixels) */
#define C_LINE 0
/* outline color */
#define OUTLINE #333333
/* number of bars (use even values for best results) */
#define NBARS 100
/* width (in pixels) of each bar*/
#define BAR_WIDTH 6
/* outline color */
#define BAR_OUTLINE OUTLINE
/* outline width (in pixels, set to 0 to disable outline drawing) */
#define BAR_OUTLINE_WIDTH 0
/* Amplify magnitude of the results each bar displays */
#define AMP_STATIC 300
#define AMPLIFY (AMP_STATIC-(mod(abs(idx),PI*2)*(PI*(AMP_STATIC/(PI*2.5)))))
/* Bar color */ 
#define COLOR #A4906D
/* Angle (in radians) for how much to rotate the visualizer */
#define ROTATE -1
/* Whether to switch left/right audio buffers */
#define INVERT 0
/* Aliasing factors. Higher values mean more defined and jagged lines.
   Note: aliasing does not have a notable impact on performance, but requires
   `xroot` transparency to be enabled since it relies on alpha blending with
   the background. */
#define BAR_ALIAS_FACTOR 1.5
#define C_ALIAS_FACTOR 1
/* Offset (Y) of the visualization */
#define CENTER_OFFSET_Y 0
/* Offset (X) of the visualization */
#define CENTER_OFFSET_X 0

/* Gravity step, override from `smooth_parameters.glsl` */
#request setgravitystep 10

/* Smoothing factor, override from `smooth_parameters.glsl` */
#request setsmoothfactor 0.05
