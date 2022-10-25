.class public Lcom/patloew/rxlocation/LocationSettingsActivity;
.super Landroid/app/Activity;
.source "LocationSettingsActivity.java"


# static fields
.field protected static final ARG_ID:Ljava/lang/String; = "id"

.field protected static final ARG_STATUS:Ljava/lang/String; = "status"

.field static final REQUEST_CODE_RESOLUTION:I = 0x7b


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method handleIntent()V
    .locals 4

    .prologue
    .line 46
    invoke-virtual {p0}, Lcom/patloew/rxlocation/LocationSettingsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "status"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/common/api/Status;

    .line 49
    .local v1, "status":Lcom/google/android/gms/common/api/Status;
    const/16 v2, 0x7b

    :try_start_0
    invoke-virtual {v1, p0, v2}, Lcom/google/android/gms/common/api/Status;->startResolutionForResult(Landroid/app/Activity;I)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    .line 54
    :goto_0
    return-void

    .line 50
    :catch_0
    move-exception v0

    .line 52
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/patloew/rxlocation/LocationSettingsActivity;->setResolutionResultAndFinish(I)V

    goto :goto_0

    .line 50
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    goto :goto_1
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 58
    const/16 v0, 0x7b

    if-ne p1, v0, :cond_0

    .line 59
    invoke-virtual {p0, p2}, Lcom/patloew/rxlocation/LocationSettingsActivity;->setResolutionResultAndFinish(I)V

    .line 63
    :goto_0
    return-void

    .line 61
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/patloew/rxlocation/LocationSettingsActivity;->setResolutionResultAndFinish(I)V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 32
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 34
    if-nez p1, :cond_0

    .line 35
    invoke-virtual {p0}, Lcom/patloew/rxlocation/LocationSettingsActivity;->handleIntent()V

    .line 37
    :cond_0
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 41
    invoke-virtual {p0, p1}, Lcom/patloew/rxlocation/LocationSettingsActivity;->setIntent(Landroid/content/Intent;)V

    .line 42
    invoke-virtual {p0}, Lcom/patloew/rxlocation/LocationSettingsActivity;->handleIntent()V

    .line 43
    return-void
.end method

.method setResolutionResultAndFinish(I)V
    .locals 2
    .param p1, "resultCode"    # I

    .prologue
    .line 66
    invoke-virtual {p0}, Lcom/patloew/rxlocation/LocationSettingsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "id"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->onResolutionResult(Ljava/lang/String;I)V

    .line 67
    invoke-virtual {p0}, Lcom/patloew/rxlocation/LocationSettingsActivity;->finish()V

    .line 68
    return-void
.end method
