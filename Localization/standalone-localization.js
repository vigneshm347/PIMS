// Load localized strings, if available for user's language
(function () {

    /* All available localized cultures should be listed in the array following this comment. 
    For example:

    'ja-JP',
    'es-ES'

    */
    var supportedCultures =
    [
    'ja-JP',
'zh-CN'
    ];



    // Sanity check for any localized cultures
    if (!supportedCultures) return;

    // Determine user's language
    var detectedLanguage = navigator.language || navigator.userLanguage;
    if (!detectedLanguage) return;
    detectedLanguage = detectedLanguage.substring(0, 2);

    // Check if browser's culture is supported
    var currentCulture = null;
    for (var i in supportedCultures) {
        if (detectedLanguage == supportedCultures[i].substring(0, 2)) {
            currentCulture = supportedCultures[i];
            break;
        }
    }

    if (!currentCulture) {
        // no matching culture found for this language
        return;
    }

    // Shim holdReady into jQuery v1.5.2
    if (!$.holdReady) {
        $.extend({
            holdReady: function (hold) {
                if (hold) {
                    jQuery.readyWait++;
                } else {
                    jQuery.ready(true);
                }
            }
        });
    }

    // Wait to load the player until the localization file is loaded
    var isLoadedLocally = !!/file/.exec(location.protocol);
    var localizationScript;
    var failoverDelay = isLoadedLocally ? 3000 : 7000; // how many ms to wait for the new file to load before proceeding without it
    function clearHold() {
        clearTimeout(failoverTimeout);
        $.holdReady(false);
    }

    $.holdReady(true);
    var failoverTimeout = setTimeout(clearHold, failoverDelay);

    // Load localized strings for selected culture
    var localizationPath = "Localization/" + currentCulture + "/TranslatedLocalizations.js";

    if (isLoadedLocally && document.location.origin) {
        // // Chrome doesn't allow $.ajax calls locally and Firefox/IE don't have location.origin
        localizationScript = document.createElement('script');
        localizationScript.id = "localizationJson";
        localizationScript.src = localizationPath;
        document.getElementsByTagName('head')[0].appendChild(localizationScript); // don't use jQuery to add the script; it automatically converts new script tags into $.getScript ajax requests, which break locally.
        $(localizationScript)  // but use jQuery for easy event handling
            .load(clearHold)
            .error(clearHold);


    } else {
        $.getScript(localizationPath, clearHold);
    }
})();