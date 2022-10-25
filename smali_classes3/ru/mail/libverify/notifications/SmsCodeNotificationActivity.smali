.class public Lru/mail/libverify/notifications/SmsCodeNotificationActivity;
.super Landroid/support/v7/app/AppCompatActivity;

# interfaces
.implements Lru/mail/libverify/notifications/b;


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:Landroid/app/AlertDialog;

.field private d:Landroid/graphics/drawable/Drawable;

.field private e:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->e:Z

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/notifications/SmsCodeNotificationActivity;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->a:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public final a(Lru/mail/libverify/api/ac$a;)V
    .locals 7

    const/4 v6, 0x1

    const/4 v5, 0x0

    if-eqz p1, :cond_0

    iget-object v0, p1, Lru/mail/libverify/api/ac$a;->f:Ljava/lang/String;

    iget-object v1, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const-string/jumbo v0, "SmsCodeActivity"

    const-string/jumbo v1, "no such notification with id %s"

    new-array v2, v6, [Ljava/lang/Object;

    iget-object v3, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->a:Ljava/lang/String;

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->finish()V

    :goto_0
    return-void

    :cond_1
    iget-boolean v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->e:Z

    if-eqz v0, :cond_2

    const-string/jumbo v0, "SmsCodeActivity"

    const-string/jumbo v1, "activity with id %s has been already deactivated"

    new-array v2, v6, [Ljava/lang/Object;

    iget-object v3, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->a:Ljava/lang/String;

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    iget-object v0, p1, Lru/mail/libverify/api/ac$a;->b:Ljava/lang/String;

    iput-object v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->b:Ljava/lang/String;

    const-string/jumbo v0, "SmsCodeActivity"

    const-string/jumbo v1, "build dialog for notification %s"

    new-array v2, v6, [Ljava/lang/Object;

    aput-object p1, v2, v5

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v0, p1, Lru/mail/libverify/api/ac$a;->b:Ljava/lang/String;

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->d:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lru/mail/libverify/R$drawable;->libverify_ic_sms_white:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/graphics/drawable/DrawableCompat;->wrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->d:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v3, Lru/mail/libverify/R$color;->libverify_secondary_icon_color:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-static {v0, v1}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTint(Landroid/graphics/drawable/Drawable;I)V

    :cond_3
    iget-object v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/app/AlertDialog$Builder;

    iget-object v0, p1, Lru/mail/libverify/api/ac$a;->a:Ljava/lang/String;

    iget-object v1, p1, Lru/mail/libverify/api/ac$a;->c:Ljava/lang/String;

    iget-object v3, p1, Lru/mail/libverify/api/ac$a;->g:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    const-string/jumbo v3, "%s\n%s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v0, v4, v5

    iget-object v0, p1, Lru/mail/libverify/api/ac$a;->g:Ljava/lang/String;

    aput-object v0, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :cond_4
    iget-object v3, p1, Lru/mail/libverify/api/ac$a;->c:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5

    sget v1, Lru/mail/libverify/R$string;->notification_event_confirm:I

    invoke-virtual {p0, v1}, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    :cond_5
    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v0, p1, Lru/mail/libverify/api/ac$a;->d:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_6

    new-instance v0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity$1;

    invoke-direct {v0, p0}, Lru/mail/libverify/notifications/SmsCodeNotificationActivity$1;-><init>(Lru/mail/libverify/notifications/SmsCodeNotificationActivity;)V

    invoke-virtual {v2, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    :cond_6
    sget v0, Lru/mail/libverify/R$string;->notification_event_cancel:I

    invoke-virtual {p0, v0}, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/notifications/SmsCodeNotificationActivity$2;

    invoke-direct {v1, p0}, Lru/mail/libverify/notifications/SmsCodeNotificationActivity$2;-><init>(Lru/mail/libverify/notifications/SmsCodeNotificationActivity;)V

    invoke-virtual {v2, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    sget v0, Lru/mail/libverify/R$string;->notification_settings:I

    invoke-virtual {p0, v0}, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/notifications/SmsCodeNotificationActivity$3;

    invoke-direct {v1, p0}, Lru/mail/libverify/notifications/SmsCodeNotificationActivity$3;-><init>(Lru/mail/libverify/notifications/SmsCodeNotificationActivity;)V

    invoke-virtual {v2, v0, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/notifications/SmsCodeNotificationActivity$4;

    invoke-direct {v1, p0}, Lru/mail/libverify/notifications/SmsCodeNotificationActivity$4;-><init>(Lru/mail/libverify/notifications/SmsCodeNotificationActivity;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    iput-object v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->c:Landroid/app/AlertDialog;

    iget-object v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->c:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    iget-object v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->c:Landroid/app/AlertDialog;

    const v1, 0x102000b

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/text/util/Linkify;->addLinks(Landroid/widget/TextView;I)Z

    goto/16 :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6

    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    sget v0, Lru/mail/libverify/R$layout;->activity_sms_code_notification:I

    invoke-virtual {p0, v0}, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->setContentView(I)V

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->finish()V

    :goto_0
    return-void

    :cond_0
    const-string/jumbo v1, "SmsCodeActivity"

    const-string/jumbo v2, "create with %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v5

    invoke-static {v5}, Lru/mail/libverify/utils/m;->a(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v1, "notification_id"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->a:Ljava/lang/String;

    iget-object v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->a:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->finish()V

    goto :goto_0

    :cond_1
    invoke-static {p0}, Lru/mail/libverify/api/k;->e(Landroid/content/Context;)Lru/mail/libverify/api/ac;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->a:Ljava/lang/String;

    invoke-interface {v0, v1}, Lru/mail/libverify/api/ac;->k(Ljava/lang/String;)V

    invoke-static {p0}, Lru/mail/libverify/api/k;->e(Landroid/content/Context;)Lru/mail/libverify/api/ac;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->a:Ljava/lang/String;

    new-instance v2, Lru/mail/libverify/notifications/a;

    invoke-direct {v2, p0}, Lru/mail/libverify/notifications/a;-><init>(Lru/mail/libverify/notifications/b;)V

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/api/ac;->a(Ljava/lang/String;Lru/mail/libverify/api/ac$b;)V

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

.method protected onPause()V
    .locals 2

    sget v0, Lru/mail/libverify/R$drawable;->libverify_ic_sms_white:I

    iget-object v1, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->b:Ljava/lang/String;

    invoke-static {p0, v0, v1}, Lru/mail/libverify/notifications/g;->a(Landroid/app/Activity;ILjava/lang/String;)V

    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onPause()V

    return-void
.end method

.method protected onStart()V
    .locals 0

    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onStart()V

    return-void
.end method

.method protected onStop()V
    .locals 1

    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onStop()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->e:Z

    iget-object v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->c:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->c:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
    return-void
.end method
