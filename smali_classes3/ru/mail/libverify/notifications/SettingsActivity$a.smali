.class public final Lru/mail/libverify/notifications/SettingsActivity$a;
.super Landroid/preference/PreferenceFragment;

# interfaces
.implements Lru/mail/libverify/notifications/b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/notifications/SettingsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/notifications/SettingsActivity$a;)Landroid/app/AlertDialog;
    .locals 5

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lru/mail/libverify/notifications/SettingsActivity$a;->b:Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v2, Lru/mail/libverify/R$drawable;->libverify_ic_sms_white:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/graphics/drawable/DrawableCompat;->wrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lru/mail/libverify/R$color;->libverify_secondary_icon_color:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-static {v0, v2}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTint(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v2, Lru/mail/libverify/R$string;->report_reuse_text_confirmation:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/notifications/SettingsActivity$a;->a:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    sget v0, Lru/mail/libverify/R$string;->notification_event_confirm:I

    invoke-virtual {p0, v0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lru/mail/libverify/notifications/SettingsActivity$a$3;

    invoke-direct {v2, p0}, Lru/mail/libverify/notifications/SettingsActivity$a$3;-><init>(Lru/mail/libverify/notifications/SettingsActivity$a;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    sget v0, Lru/mail/libverify/R$string;->notification_event_cancel:I

    invoke-virtual {p0, v0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lru/mail/libverify/notifications/SettingsActivity$a$4;

    invoke-direct {v2, p0}, Lru/mail/libverify/notifications/SettingsActivity$a$4;-><init>(Lru/mail/libverify/notifications/SettingsActivity$a;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto :goto_0
.end method

.method private a()V
    .locals 3

    iget-object v0, p0, Lru/mail/libverify/notifications/SettingsActivity$a;->c:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "notification_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/notifications/SettingsActivity$a;->c:Ljava/lang/String;

    iget-object v0, p0, Lru/mail/libverify/notifications/SettingsActivity$a;->c:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lru/mail/libverify/api/k;->e(Landroid/content/Context;)Lru/mail/libverify/api/ac;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/notifications/SettingsActivity$a;->c:Ljava/lang/String;

    new-instance v2, Lru/mail/libverify/notifications/a;

    invoke-direct {v2, p0}, Lru/mail/libverify/notifications/a;-><init>(Lru/mail/libverify/notifications/b;)V

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/api/ac;->a(Ljava/lang/String;Lru/mail/libverify/api/ac$b;)V

    goto :goto_0
.end method

.method static synthetic b(Lru/mail/libverify/notifications/SettingsActivity$a;)Z
    .locals 4

    const/4 v0, 0x1

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lru/mail/libverify/R$string;->setting_saved_toast_text:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method static synthetic c(Lru/mail/libverify/notifications/SettingsActivity$a;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/notifications/SettingsActivity$a;->c:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public final a(Lru/mail/libverify/api/ac$a;)V
    .locals 7

    const/4 v6, 0x1

    const/4 v2, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lru/mail/libverify/api/ac$a;->f:Ljava/lang/String;

    iget-object v1, p0, Lru/mail/libverify/notifications/SettingsActivity$a;->c:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_0
    const-string/jumbo v0, "SettingsActivity"

    const-string/jumbo v1, "no such notification with id %s or activity has been finished"

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lru/mail/libverify/notifications/SettingsActivity$a;->c:Ljava/lang/String;

    aput-object v4, v3, v2

    invoke-static {v0, v1, v3}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    :cond_1
    :goto_0
    return-void

    :cond_2
    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lru/mail/libverify/api/k;->e(Landroid/content/Context;)Lru/mail/libverify/api/ac;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/notifications/SettingsActivity$a;->c:Ljava/lang/String;

    invoke-interface {v0, v1}, Lru/mail/libverify/api/ac;->i(Ljava/lang/String;)V

    iget-object v0, p1, Lru/mail/libverify/api/ac$a;->e:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v3, 0x4

    if-gt v1, v3, :cond_3

    :goto_1
    iput-object v0, p0, Lru/mail/libverify/notifications/SettingsActivity$a;->a:Ljava/lang/String;

    iget-object v0, p1, Lru/mail/libverify/api/ac$a;->b:Ljava/lang/String;

    iput-object v0, p0, Lru/mail/libverify/notifications/SettingsActivity$a;->b:Ljava/lang/String;

    sget v0, Lru/mail/libverify/R$xml;->notification_settings:I

    invoke-virtual {p0, v0}, Lru/mail/libverify/notifications/SettingsActivity$a;->addPreferencesFromResource(I)V

    const-string/jumbo v0, "preference_report_reuse"

    invoke-virtual {p0, v0}, Lru/mail/libverify/notifications/SettingsActivity$a;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v3, Lru/mail/libverify/R$string;->report_reuse_text:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lru/mail/libverify/notifications/SettingsActivity$a;->a:Ljava/lang/String;

    aput-object v4, v3, v2

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    new-instance v1, Lru/mail/libverify/notifications/SettingsActivity$a$1;

    invoke-direct {v1, p0}, Lru/mail/libverify/notifications/SettingsActivity$a$1;-><init>(Lru/mail/libverify/notifications/SettingsActivity$a;)V

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    const-string/jumbo v0, "preference_block_notifications"

    invoke-virtual {p0, v0}, Lru/mail/libverify/notifications/SettingsActivity$a;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/notifications/SettingsActivity$a$2;

    invoke-direct {v1, p0}, Lru/mail/libverify/notifications/SettingsActivity$a$2;-><init>(Lru/mail/libverify/notifications/SettingsActivity$a;)V

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string/jumbo v1, "%s (%s)"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lru/mail/libverify/R$string;->title_activity_settings:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    iget-object v2, p0, Lru/mail/libverify/notifications/SettingsActivity$a;->b:Ljava/lang/String;

    aput-object v2, v3, v6

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v4, v1, -0x4

    move v1, v2

    :goto_2
    if-ge v1, v4, :cond_4

    const/16 v5, 0x2a

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_4
    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-direct {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->a()V

    return-void
.end method

.method public final setArguments(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->setArguments(Landroid/os/Bundle;)V

    invoke-direct {p0}, Lru/mail/libverify/notifications/SettingsActivity$a;->a()V

    return-void
.end method
