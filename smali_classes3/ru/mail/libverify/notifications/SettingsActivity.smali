.class public Lru/mail/libverify/notifications/SettingsActivity;
.super Landroid/support/v7/app/AppCompatActivity;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/notifications/SettingsActivity$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity;->finish()V

    :goto_0
    return-void

    :cond_0
    const-string/jumbo v1, "SettingsActivity"

    const-string/jumbo v2, "create with %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lru/mail/libverify/utils/m;->a(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v4

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lru/mail/libverify/notifications/SettingsActivity$a;

    invoke-direct {v0}, Lru/mail/libverify/notifications/SettingsActivity$a;-><init>()V

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Lru/mail/libverify/notifications/SettingsActivity$a;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    const v2, 0x1020002

    invoke-virtual {v1, v2, v0}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    sget v0, Lru/mail/libverify/R$drawable;->libverify_ic_sms_white:I

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lru/mail/libverify/R$string;->title_activity_settings:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lru/mail/libverify/notifications/g;->a(Landroid/app/Activity;ILjava/lang/String;)V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method
