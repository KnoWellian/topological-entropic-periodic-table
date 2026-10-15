# ====================================================================
# Copyright (c) 2026 David Noel Lynch. All rights reserved.
# Project: Topological Entropic Cosmology Visual Analytics Layer
# Module: kut_wave_visualization (64-Channel Splay Frequency Plotter)
# ====================================================================

import numpy as np
import matplotlib.pyplot as plt

def plot_kut_splay_channels():
    # 1. Initialize Baseline KUT Core Parameters
    psi_base = 432.081216  # Resonant clock Matrix Core in MHz
    epsilon_kut = 0.081216  # KnoWellian Offset Tensor
    phi = (1.0 + np.sqrt(5.0)) / 2.0  # Golden Ratio vacuum substrate metric
    
    # Generate 1000 uniform spatial coordinate steps across the Event-Point territory
    x = np.linspace(0, 1, 1000)
    
    # 2. Configure the Plotting Canvas Layout
    plt.figure(figsize=(12, 7), facecolor='#1e1e1e')
    ax = plt.axes()
    ax.set_facecolor('#151515')
    
    # 3. Simulate Core Target Splay Wave Vectors (Z % 64 Coordinates)
    # Target 1: Hydrogen (Z=1, Tonic Base Thread)
    y_h = np.sin(2 * np.pi * (1 * (psi_base / 100)) * x) * np.exp(-epsilon_kut * x)
    # Target 2: Helium (Z=2, Octave Axis Closure Gate)
    y_he = np.sin(2 * np.pi * (2 * (psi_base / 100)) * x) * phi
    # Target 3: Iron Peak (Z=26, Crucible Transition Band Inversion)
    y_fe = np.cos(2 * np.pi * (26 * (psi_base / 100)) * x) * (1.5 * epsilon_kut)
    # Target 4: Oganesson Boundary Limit Cutoff (Z=118)
    y_og = np.sin(2 * np.pi * ((118 % 64) * (psi_base / 100)) * x)
    
    # 4. Render the Mathematical Traces onto the Canvas
    ax.plot(x, y_h, color='#00ffcc', label='Hydrogen (Z=1) - Tonic Base Thread', linewidth=2)
    ax.plot(x, y_he, color='#ff00ff', label='Helium (Z=2) - Octave Axis Gate', linewidth=2)
    ax.plot(x, y_fe, color='#ffcc00', label='Iron Peak (Z=26) - Transition Crucible', linewidth=1.5)
    ax.plot(x, y_og, color='#ff3333', label='Oganesson (Z=118) - Terminal Boundary', linewidth=1.5, linestyle='--')
    
    # 5. Format Academic Metadata Labels
    ax.set_title("KnoWellian Universe Theory: 64-Channel Spatial Splay Wave Mechanics", color='#ffffff', fontsize=14, pad=15)
    ax.set_xlabel("Event-Point Coordinate Domain Boundary (1x1x1 Spatial Continuum)", color='#aaaaaa', fontsize=11)
    ax.set_ylabel("Topological Amplitude Phase Vector", color='#aaaaaa', fontsize=11)
    
    # Customize axis parameter ticks and borders
    ax.tick_params(colors='#ffffff')
    ax.xaxis.label.set_color('#aaaaaa')
    ax.yaxis.label.set_color('#aaaaaa')
    for spine in ax.spines.values():
        spine.set_color('#444444')
        
    # Inject the structural tracking legend
    legend = ax.legend(facecolor='#1a1a1a', edgecolor='#444444')
    for text in legend.get_texts():
        text.set_color('#ffffff')
        
    ax.grid(True, color='#222222', linestyle=':', linewidth=0.5)
    
    # 6. Display the Finalized Mathematical Matrix Wave Output
    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    plot_kut_splay_channels()
