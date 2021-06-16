# CASH-BUTTON-SDK
-keeppackagenames
-keep class com.avatye.sdk.cashbutton.** { *; }
-dontwarn com.avatye.sdk.cashbutton.**


# Gson specific classes
-keep class sun.misc.Unsafe { *; }
-keepattributes *Annotation*
-keepattributes Signature


# IGAWORKS
-keep class com.igaworks.** { *; }
-dontwarn com.igaworks.**
-keep class com.igaworks.gson.stream.** { *; }
-keep class com.igaworks.adbrix.model.** { *; }


## Channel Tlak
-keep class com.google.zxing.** { *; }
-keep class com.zoyi.**{
   *;
}
-dontwarn com.zoyi.**


# UnityAds - Mediation
-keep class com.unity3d.ads.** { *; }
-keep class com.unity3d.services.** { *; }
-dontwarn com.google.ar.core.**


# Vungle - Mediation
-dontwarn com.vungle.warren.downloader.DownloadRequestMediator$Status
-dontwarn com.vungle.warren.error.VungleError$ErrorCode
## Vungle { Google }
-dontwarn com.google.android.gms.common.GoogleApiAvailabilityLight
-dontwarn com.google.android.gms.ads.identifier.AdvertisingIdClient
-dontwarn com.google.android.gms.ads.identifier.AdvertisingIdClient$Info
## Vungle { Moat SDK }
-keep class com.moat.** { *; }
-dontwarn com.moat.**
## Vungle {Prevent R8 from leaving Data object members always null}
-keepclassmembers,allowobfuscation class * {
  @com.google.gson.annotations.SerializedName <fields>;
}
## Vungle { OkHttp + Okio }
-dontwarn javax.annotation.**
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase
-dontwarn org.codehaus.mojo.animal_sniffer.*
-dontwarn okhttp3.internal.platform.ConscryptPlatform


# AdColony - Mediation
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
## AdColony { For removing warnings due to lack of Multi-Window support }
-dontwarn android.app.Activity


# Mobon - Mediation
-dontwarn com.httpmodule.**
-dontwarn com.imgmodule.**
-keep class com.httpmodule.** { *; }
-keep class com.imgmodule.** { *; }
-keep public class com.mobon.**{
public *;
}