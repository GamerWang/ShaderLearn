
using UnityEngine;
using System.Collections;
using System.Collections.Generic;

[ExecuteInEditMode]
public class ProceduralTextureGeneration_my : MonoBehaviour {
	// static variables
	static int previousTexWidth;
	static Color previousBGColor;
	static Color previousCircleColor;
	static float previousFactor;

	// GUI editable variables
	public Material material = null;

	public int textureWidth = 512;

	public Color backgroundColor = Color.white;

	public Color circleColor = Color.yellow;

	public float blurFactor = 2;

	private Texture2D _generatedTexture = null;

	void Start() {
		if(material == null) {
			Renderer renderer = gameObject.GetComponent<Renderer>();
			if(renderer == null) {
				Debug.LogWarning("Cannot find a renderer.");
				return;
			}

			material = renderer.sharedMaterial;
		}

		_UpdateMaterial();
	}

	void Update() {
		if(material == null) {
			Renderer renderer = gameObject.GetComponent<Renderer>();
			if(renderer == null) {
				Debug.LogWarning("Cannot find a renderer.");
				return;
			}

			material = renderer.sharedMaterial;
		}

		bool changed = false;
		if(textureWidth != previousTexWidth) {
			previousTexWidth = textureWidth;
			changed = true;
		}
		if(backgroundColor != previousBGColor) {
			previousBGColor = backgroundColor;
			changed = true;
		}
		if(circleColor != previousCircleColor) {
			previousCircleColor = circleColor;
			changed = true;
		}
		if(blurFactor != previousFactor) {
			previousFactor = blurFactor;
			changed = true;
		}

		if(changed) {
			_UpdateMaterial();
		}
	}

	private void _UpdateMaterial() {
		if(material != null) {
			_generatedTexture = _GenerateProceduralTexture();
			material.SetTexture("_MainTex", _generatedTexture);
		}
	}

	private Color _MixColor(Color color0, Color color1, float mixFactor) {
		Color mixColor = Color.white;
		mixColor.r = Mathf.Lerp(color0.r, color1.r, mixFactor);
		mixColor.g = Mathf.Lerp(color0.g, color1.g, mixFactor);
		mixColor.b = Mathf.Lerp(color0.b, color1.b, mixFactor);
		mixColor.a = Mathf.Lerp(color0.a, color1.a, mixFactor);
		return mixColor;
	}

	private Texture2D _GenerateProceduralTexture() {

		Texture2D proceduralTexture = new Texture2D(textureWidth, textureWidth);

		// the interval between circles
		float circleInterval = textureWidth / 4.0f;
		// the radius of circles
		float radius = textureWidth / 10.0f;
		// the blur factor
		float edgeBlur = 1.0f / blurFactor;

		for(int w = 0; w < textureWidth; w++) {
			for(int h = 0; h < textureWidth; h++) {
				// Initialize the pixel with background color
				Color pixel = backgroundColor;

				// Draw nine circles one by one
				for(int i = 0; i < 3; i++) {
					for(int j = 0; j < 3; j++) {
						// Compute the center of current circle
						Vector2 circleCenter = new Vector2(circleInterval * (i + 1),
							circleInterval * (j + 1));
						
						// Compute the distance between the pixel and the center
						float dist = 
							Vector2.Distance(new Vector2(w, h), circleCenter) - radius;

						// Blur the edge of the circle
						Color color = _MixColor(circleColor, 
							new Color(pixel.r, pixel.g, pixel.b, 0.0f),
							Mathf.SmoothStep(0f, 1.0f, dist * edgeBlur));

						// Mix the current color with the previous color
						pixel = _MixColor(pixel, color, color.a);
					}
				}

				proceduralTexture.SetPixel(w, h, pixel);
			}
		}

		proceduralTexture.Apply();

		return proceduralTexture;
	}
}
