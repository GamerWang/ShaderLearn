using UnityEngine;
using System.Collections;

public class ColorPicker : MonoBehaviour {
	// static variables
	static Texture2D m_staticRectTexture;
	static GUIStyle m_staticRectStyle;
	static Vector3 m_pixelPosition = Vector3.zero;

	// GUI editable variables
	public BoxCollider pickerCollider;

	// private references & variables
	bool m_grab;
	Camera m_camera;
	Texture2D m_screenRenderTexture;
	Color m_pickedColor = Color.white;

	void Awake () {
		// Get the Camera Component
		m_camera = GetComponent<Camera>();
		if (m_camera == null) {
			Debug.LogError ("You need to drag this script to a camera!");
			return;
		}

		// Attach a BoxCollider to this camera to receive mouse events
		if (pickerCollider == null) {
			pickerCollider = gameObject.AddComponent<BoxCollider> ();
			// Make sure the collider is in the camera's frustum
			var position = Vector3.zero;
			position += m_camera.transform.worldToLocalMatrix
				.MultiplyVector (m_camera.transform.forward) * (m_camera.nearClipPlane + 0.2f);
			pickerCollider.center = position;
			pickerCollider.size = new Vector3 (Screen.width, Screen.height, 0.1f);
		}
	}

	// Draw the color we picked
	public static void GUIDrawRect (Rect position, Color color) {
		if (m_staticRectTexture == null) {
			m_staticRectTexture = new Texture2D (1, 1);
		}

		if (m_staticRectStyle == null) {
			m_staticRectStyle = new GUIStyle ();
		}

		m_staticRectTexture.SetPixel (0, 0, color);
		m_staticRectTexture.Apply ();

		m_staticRectStyle.normal.background = m_staticRectTexture;

		GUI.Box (position, GUIContent.none, m_staticRectStyle);
	}

	// OnPostRender is called after a camera has finished rendering the scene
	// This message is sent to all scripts attached to the camera
	// Use it to grab the screen
	// Note: grabing is a expensive operation
	void OnPostRender () {
		if (m_grab) { 
			if (m_grab) {
				m_screenRenderTexture = new Texture2D (Screen.width, Screen.height);
				m_screenRenderTexture.ReadPixels (new Rect (0, 0, Screen.width, Screen.height), 0, 0);
				m_screenRenderTexture.Apply ();
				m_pickedColor = m_screenRenderTexture.GetPixel (
					Mathf.FloorToInt (m_pixelPosition.x), 
					Mathf.FloorToInt (m_pixelPosition.y));
				m_grab = false;
			}
		}
	}

	void OnMouseDown () {
		m_grab = true;
		// Record the mouse position to pick pixel
		m_pixelPosition = Input.mousePosition;
	}

	void OnGUI() {
		GUI.Box (new Rect (0, 0, 120, 200), "Color Picker");
		GUIDrawRect (new Rect (20, 30, 80, 80), m_pickedColor);
		GUI.Label (new Rect (10, 120, 100, 20),
			"R: " + System.Math.Round ((double)m_pickedColor.r, 4) + 
			"\t(" + Mathf.FloorToInt (m_pickedColor.r * 255) + ")");
		GUI.Label (new Rect (10, 140, 100, 20),
			"R: " + System.Math.Round ((double)m_pickedColor.g, 4) + 
			"\t(" + Mathf.FloorToInt (m_pickedColor.g * 255) + ")");
		GUI.Label (new Rect (10, 160, 100, 20),
			"R: " + System.Math.Round ((double)m_pickedColor.b, 4) + 
			"\t(" + Mathf.FloorToInt (m_pickedColor.b * 255) + ")");
		GUI.Label (new Rect (10, 180, 100, 20),
			"R: " + System.Math.Round ((double)m_pickedColor.a, 4) + 
			"\t(" + Mathf.FloorToInt (m_pickedColor.a * 255) + ")");
	}
}
