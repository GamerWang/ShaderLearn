using UnityEngine;
using UnityEditor;
using System.Collections;

public class RenderCubemapWizard : ScriptableWizard {
	public Transform _renderFromPosition;
	public Cubemap _cubemap;

	void OnWizardUpdate() {
		helpString = "Select transform to render from and cubemap to render into";
		isValid = (_renderFromPosition != null) && (_cubemap != null);
	}

	void OnWizardCreate() {
		// create temporary camera for rendering
		GameObject tempCamera = new GameObject("CubemapCamera");
		var camera = tempCamera.AddComponent<Camera>();
		// place it on the object's position
		tempCamera.transform.position = _renderFromPosition.position;
		// render into cubemap
		camera.RenderToCubemap(_cubemap);
		// destroy temporary camera
		DestroyImmediate(tempCamera);
	}

	[MenuItem("GameObject/Render into Cubemap")]
	static void RenderCubemap() {
		ScriptableWizard.DisplayWizard<RenderCubemapWizard>(
			"Render cubemap", "Render!");
	}
}
