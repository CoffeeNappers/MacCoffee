.class final Lru/mail/libverify/notifications/SettingsActivity$a$2$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/notifications/SettingsActivity$a$2;->onPreferenceClick(Landroid/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/notifications/SettingsActivity$a$2;


# direct methods
.method constructor <init>(Lru/mail/libverify/notifications/SettingsActivity$a$2;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/notifications/SettingsActivity$a$2$1;->a:Lru/mail/libverify/notifications/SettingsActivity$a$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 3

    iget-object v0, p0, Lru/mail/libverify/notifications/SettingsActivity$a$2$1;->a:Lru/mail/libverify/notifications/SettingsActivity$a$2;

    iget-object v0, v0, Lru/mail/libverify/notifications/SettingsActivity$a$2;->a:Lru/mail/libverify/notifications/SettingsActivity$a;

    invoke-static {v0}, Lru/mail/libverify/notifications/SettingsActivity$a;->b(Lru/mail/libverify/notifications/SettingsActivity$a;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/notifications/SettingsActivity$a$2$1;->a:Lru/mail/libverify/notifications/SettingsActivity$a$2;

    iget-object v0, v0, Lru/mail/libverify/notifications/SettingsActivity$a$2;->a:Lru/mail/libverify/notifications/SettingsActivity$a;

    invoke-virtual {v0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lru/mail/libverify/api/k;->e(Landroid/content/Context;)Lru/mail/libverify/api/ac;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/notifications/SettingsActivity$a$2$1;->a:Lru/mail/libverify/notifications/SettingsActivity$a$2;

    iget-object v1, v1, Lru/mail/libverify/notifications/SettingsActivity$a$2;->a:Lru/mail/libverify/notifications/SettingsActivity$a;

    invoke-static {v1}, Lru/mail/libverify/notifications/SettingsActivity$a;->c(Lru/mail/libverify/notifications/SettingsActivity$a;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/api/ac;->a(Ljava/lang/String;I)V

    const/4 v0, 0x1

    goto :goto_0
.end method
