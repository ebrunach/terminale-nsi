import pygame
from pygame.locals import *

from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *
import sys

# The main drawing function. 
def DrawGLScene(rtri, rquad):
       # Clear The Screen And The Depth Buffer
        glLoadIdentity();                                        # Reset The View
        glTranslatef(-1.5,0.0,-6.0);                                # Move Left And Into The Screen
        glRotatef(rtri,0.0,1.0,0.0);                                # Rotate The Pyramid On It's Y Axis
        glBegin(GL_TRIANGLES);                                        # Start Drawing The Pyramid
        glColor3f(1.0,0.0,0.0);                        # Red
        glVertex3f( 0.0, 1.0, 0.0);                # Top Of Triangle (Front)
        glColor3f(0.0,1.0,0.0);                        # Green
        glVertex3f(-1.0,-1.0, 1.0);                # Left Of Triangle (Front)
        glColor3f(0.0,0.0,1.0);                        # Blue
        glVertex3f( 1.0,-1.0, 1.0);
        glColor3f(1.0,0.0,0.0);                        # Red
        glVertex3f( 0.0, 1.0, 0.0);                # Top Of Triangle (Right)
        glColor3f(0.0,0.0,1.0);                        # Blue
        glVertex3f( 1.0,-1.0, 1.0);                # Left Of Triangle (Right)
        glColor3f(0.0,1.0,0.0);                        # Green
        glVertex3f( 1.0,-1.0, -1.0);                # Right 
        glColor3f(1.0,0.0,0.0);                        # Red
        glVertex3f( 0.0, 1.0, 0.0);                # Top Of Triangle (Back)
        glColor3f(0.0,1.0,0.0);                        # Green
        glVertex3f( 1.0,-1.0, -1.0);                # Left Of Triangle (Back)
        glColor3f(0.0,0.0,1.0);                        # Blue
        glVertex3f(-1.0,-1.0, -1.0);                # Right Of 
        glColor3f(1.0,0.0,0.0);                        # Red
        glVertex3f( 0.0, 1.0, 0.0);                # Top Of Triangle (Left)
        glColor3f(0.0,0.0,1.0);                        # Blue
        glVertex3f(-1.0,-1.0,-1.0);                # Left Of Triangle (Left)
        glColor3f(0.0,1.0,0.0);                        # Green
        glVertex3f(-1.0,-1.0, 1.0);                # Right Of Triangle (Left)
        glEnd();        
        glLoadIdentity();                                        # Reset The View
        glTranslatef(1.5,0.0,-7.0);                # Move Right And Into The Screen
        glRotatef(rquad,1.0,1.0,1.0);                # Rotate The Cube On X, Y & Z
        glBegin(GL_QUADS);                        # Start Drawing The Cube
        glColor3f(0.0,1.0,0.0);                        # Set The Color To Blue
        glVertex3f( 1.0, 1.0,-1.0);                # Top Right Of The Quad (Top)
        glVertex3f(-1.0, 1.0,-1.0);                # Top Left Of The Quad (Top)
        glVertex3f(-1.0, 1.0, 1.0);                # Bottom Left Of The Quad (Top)
        glVertex3f( 1.0, 1.0, 1.0);                # Bottom Right Of The Quad (Top)
        glColor3f(1.0,0.5,0.0);                        # Set The Color To Orange
        glVertex3f( 1.0,-1.0, 1.0);                # Top Right Of The Quad (Bottom)
        glVertex3f(-1.0,-1.0, 1.0);                # Top Left Of The Quad (Bottom)
        glVertex3f(-1.0,-1.0,-1.0);                # Bottom Left Of The Quad (Bottom)
        glVertex3f( 1.0,-1.0,-1.0);                # Bottom Right Of The Quad (Bottom)
        glColor3f(1.0,0.0,0.0);                        # Set The Color To Red
        glVertex3f( 1.0, 1.0, 1.0);                # Top Right Of The Quad (Front)
        glVertex3f(-1.0, 1.0, 1.0);                # Top Left Of The Quad (Front)
        glVertex3f(-1.0,-1.0, 1.0);                # Bottom Left Of The Quad (Front)
        glVertex3f( 1.0,-1.0, 1.0);                # Bottom Right Of The Quad (Front)
        glColor3f(1.0,1.0,0.0);                        # Set The Color To Yellow
        glVertex3f( 1.0,-1.0,-1.0);                # Bottom Left Of The Quad (Back)
        glVertex3f(-1.0,-1.0,-1.0);                # Bottom Right Of The Quad (Back)
        glVertex3f(-1.0, 1.0,-1.0);                # Top Right Of The Quad (Back)
        glVertex3f( 1.0, 1.0,-1.0);                # Top Left Of The Quad (Back)
        glColor3f(0.0,0.0,1.0);                        # Set The Color To Blue
        glVertex3f(-1.0, 1.0, 1.0);                # Top Right Of The Quad (Left)
        glVertex3f(-1.0, 1.0,-1.0);                # Top Left Of The Quad (Left)
        glVertex3f(-1.0,-1.0,-1.0);                # Bottom Left Of The Quad (Left)
        glVertex3f(-1.0,-1.0, 1.0);                # Bottom Right Of The Quad (Left)
        glColor3f(1.0,0.0,1.0);                        # Set The Color To Violet
        glVertex3f( 1.0, 1.0,-1.0);                # Top Right Of The Quad (Right)
        glVertex3f( 1.0, 1.0, 1.0);                # Top Left Of The Quad (Right)
        glVertex3f( 1.0,-1.0, 1.0);                # Bottom Left Of The Quad (Right)
        glVertex3f( 1.0,-1.0,-1.0);                # Bottom Right Of The Quad (Right)
        glEnd();                                # Done Drawing The Quad
        rtri  = rtri + 1.0                  # Increase The Rotation Variable For The Triangle
        rquad = rquad - 1.0                 # Decrease The Rotation Variable For The Quad
        return rtri, rquad
 



def main():
    pygame.init()
    display = (800,600)
    pygame.display.set_mode(display, DOUBLEBUF|OPENGL)
    glClearColor(0.0, 0.0, 0.0, 0.0)        # This Will Clear The Background Color To Black
    glClearDepth(1.0)                                        # Enables Clearing Of The Depth Buffer
    glDepthFunc(GL_LESS)                                # The Type Of Depth Test To Do
    glEnable(GL_DEPTH_TEST)                                # Enables Depth Testing
    glShadeModel(GL_SMOOTH)                                # Enables Smooth Color Shading
    glMatrixMode(GL_PROJECTION)
    gluPerspective(45, (800/600), 0.1, 50.0)
    rtri, rquad = 0, 0
    glMatrixMode(GL_MODELVIEW)

    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                quit()

        glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT)
        rtri, rquad = DrawGLScene(rtri, rquad)
        pygame.display.flip()
        pygame.time.wait(10)

# Print message to console, and kick off the main to get it rolling.
print("Hit X icon to quit.")
main()