.class public Lcom/vkontakte/android/ui/Fonts;
.super Ljava/lang/Object;
.source "Fonts.java"


# static fields
.field private static lightTypeface:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getRobotoLight()Landroid/graphics/Typeface;
    .locals 2

    .prologue
    .line 14
    sget-object v0, Lcom/vkontakte/android/ui/Fonts;->lightTypeface:Landroid/graphics/Typeface;

    if-eqz v0, :cond_0

    .line 15
    sget-object v0, Lcom/vkontakte/android/ui/Fonts;->lightTypeface:Landroid/graphics/Typeface;

    .line 17
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "sans-serif-light"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/ui/Fonts;->lightTypeface:Landroid/graphics/Typeface;

    goto :goto_0
.end method
