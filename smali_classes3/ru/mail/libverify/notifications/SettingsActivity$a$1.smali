.class final Lru/mail/libverify/notifications/SettingsActivity$a$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/notifications/SettingsActivity$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/notifications/SettingsActivity$a;


# direct methods
.method constructor <init>(Lru/mail/libverify/notifications/SettingsActivity$a;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/notifications/SettingsActivity$a$1;->a:Lru/mail/libverify/notifications/SettingsActivity$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/notifications/SettingsActivity$a$1;->a:Lru/mail/libverify/notifications/SettingsActivity$a;

    invoke-static {v0}, Lru/mail/libverify/notifications/SettingsActivity$a;->a(Lru/mail/libverify/notifications/SettingsActivity$a;)Landroid/app/AlertDialog;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    const/4 v0, 0x1

    goto :goto_0
.end method
