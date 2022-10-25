.class public Lcom/vkontakte/android/auth/VKAccountEditor;
.super Ljava/lang/Object;
.source "VKAccountEditor.java"


# instance fields
.field private account:Lcom/vkontakte/android/auth/VKAccount;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/auth/VKAccount;)V
    .locals 1
    .param p1, "account"    # Lcom/vkontakte/android/auth/VKAccount;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Lcom/vkontakte/android/auth/VKAccount;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/auth/VKAccount;-><init>(Lcom/vkontakte/android/auth/VKAccount;)V

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccountEditor;->account:Lcom/vkontakte/android/auth/VKAccount;

    .line 12
    return-void
.end method


# virtual methods
.method public commit()V
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccountEditor;->account:Lcom/vkontakte/android/auth/VKAccount;

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->updateCurrent(Lcom/vkontakte/android/auth/VKAccount;)Z

    .line 66
    return-void
.end method

.method public setAccessToken(Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAccountEditor;
    .locals 1
    .param p1, "accessToken"    # Ljava/lang/String;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccountEditor;->account:Lcom/vkontakte/android/auth/VKAccount;

    iput-object p1, v0, Lcom/vkontakte/android/auth/VKAccount;->accessToken:Ljava/lang/String;

    .line 36
    return-object p0
.end method

.method public setCountry(I)Lcom/vkontakte/android/auth/VKAccountEditor;
    .locals 1
    .param p1, "country"    # I

    .prologue
    .line 30
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccountEditor;->account:Lcom/vkontakte/android/auth/VKAccount;

    iput p1, v0, Lcom/vkontakte/android/auth/VKAccount;->country:I

    .line 31
    return-object p0
.end method

.method public setExportFacebookAvail(Z)Lcom/vkontakte/android/auth/VKAccountEditor;
    .locals 1
    .param p1, "exportFacebookAvail"    # Z

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccountEditor;->account:Lcom/vkontakte/android/auth/VKAccount;

    iput-boolean p1, v0, Lcom/vkontakte/android/auth/VKAccount;->exportFacebookAvail:Z

    .line 61
    return-object p0
.end method

.method public setExportTwitterAvail(Z)Lcom/vkontakte/android/auth/VKAccountEditor;
    .locals 1
    .param p1, "exportTwitterAvail"    # Z

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccountEditor;->account:Lcom/vkontakte/android/auth/VKAccount;

    iput-boolean p1, v0, Lcom/vkontakte/android/auth/VKAccount;->exportTwitterAvail:Z

    .line 56
    return-object p0
.end method

.method public setIntro(I)Lcom/vkontakte/android/auth/VKAccountEditor;
    .locals 1
    .param p1, "intro"    # I

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccountEditor;->account:Lcom/vkontakte/android/auth/VKAccount;

    iput p1, v0, Lcom/vkontakte/android/auth/VKAccount;->intro:I

    .line 46
    return-object p0
.end method

.method public setMusicIntro(Z)Lcom/vkontakte/android/auth/VKAccountEditor;
    .locals 1
    .param p1, "musicIntroWasShowed"    # Z

    .prologue
    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccountEditor;->account:Lcom/vkontakte/android/auth/VKAccount;

    iput-boolean p1, v0, Lcom/vkontakte/android/auth/VKAccount;->musicIntroWasShowed:Z

    .line 51
    return-object p0
.end method

.method public setName(Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAccountEditor;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 15
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccountEditor;->account:Lcom/vkontakte/android/auth/VKAccount;

    iput-object p1, v0, Lcom/vkontakte/android/auth/VKAccount;->name:Ljava/lang/String;

    .line 16
    return-object p0
.end method

.method public setPhoto(Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAccountEditor;
    .locals 1
    .param p1, "photo"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 20
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccountEditor;->account:Lcom/vkontakte/android/auth/VKAccount;

    iput-object p1, v0, Lcom/vkontakte/android/auth/VKAccount;->photo:Ljava/lang/String;

    .line 21
    return-object p0
.end method

.method public setSecret(Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAccountEditor;
    .locals 1
    .param p1, "secret"    # Ljava/lang/String;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccountEditor;->account:Lcom/vkontakte/android/auth/VKAccount;

    iput-object p1, v0, Lcom/vkontakte/android/auth/VKAccount;->secret:Ljava/lang/String;

    .line 41
    return-object p0
.end method

.method public setStatus(Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAccountEditor;
    .locals 1
    .param p1, "status"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 25
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccountEditor;->account:Lcom/vkontakte/android/auth/VKAccount;

    iput-object p1, v0, Lcom/vkontakte/android/auth/VKAccount;->status:Ljava/lang/String;

    .line 26
    return-object p0
.end method
