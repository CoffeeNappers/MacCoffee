.class public Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "HtmlGameFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/HtmlGameFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# static fields
.field private static final KEY_APP_ID:Ljava/lang/String; = "app_id"

.field private static final KEY_OWNER_ID:Ljava/lang/String; = "owner_id"

.field private static final KEY_SCREEN_ORIENTATION:Ljava/lang/String; = "screen_orientation"

.field private static final KEY_SCREEN_TITLE:Ljava/lang/String; = "screen_title"

.field private static final KEY_URL:Ljava/lang/String; = "key_url"

.field private static final KEY_URL_TO_COPY:Ljava/lang/String; = "url_to_copy"


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "ownerId"    # I
    .param p3, "appId"    # I

    .prologue
    const/4 v2, 0x1

    .line 118
    const-class v0, Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 120
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "key_url"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "owner_id"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 122
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "app_id"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 124
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "fullscreen"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 125
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "disable_drawer_layout"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 126
    return-void
.end method

.method private static getAndroidOrientation(I)I
    .locals 1
    .param p0, "orientation"    # I

    .prologue
    .line 144
    packed-switch p0, :pswitch_data_0

    .line 150
    const/4 v0, -0x1

    :goto_0
    return v0

    .line 146
    :pswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 148
    :pswitch_1
    const/4 v0, 0x0

    goto :goto_0

    .line 144
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public setOrienation(I)Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;
    .locals 3
    .param p1, "orientation"    # I

    .prologue
    .line 139
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "orientation"

    invoke-static {p1}, Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;->getAndroidOrientation(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 140
    return-object p0
.end method

.method public setScreenTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;
    .locals 2
    .param p1, "screenTitle"    # Ljava/lang/String;

    .prologue
    .line 134
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "screen_title"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    return-object p0
.end method

.method public setUrlToCopy(Ljava/lang/String;)Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;
    .locals 2
    .param p1, "urlToCopy"    # Ljava/lang/String;

    .prologue
    .line 129
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "url_to_copy"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    return-object p0
.end method
