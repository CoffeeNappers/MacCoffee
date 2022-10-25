.class public Landroid/support/v7/preference/PreferenceManager$SimplePreferenceComparisonCallback;
.super Landroid/support/v7/preference/PreferenceManager$PreferenceComparisonCallback;
.source "PreferenceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/preference/PreferenceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimplePreferenceComparisonCallback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 569
    invoke-direct {p0}, Landroid/support/v7/preference/PreferenceManager$PreferenceComparisonCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public arePreferenceContentsTheSame(Landroid/support/v7/preference/Preference;Landroid/support/v7/preference/Preference;)Z
    .locals 5
    .param p1, "p1"    # Landroid/support/v7/preference/Preference;
    .param p2, "p2"    # Landroid/support/v7/preference/Preference;

    .prologue
    const/4 v3, 0x0

    .line 594
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v2, v4, :cond_0

    move v2, v3

    .line 630
    :goto_0
    return v2

    .line 597
    :cond_0
    if-ne p1, p2, :cond_1

    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->wasDetached()Z

    move-result v2

    if-eqz v2, :cond_1

    move v2, v3

    .line 600
    goto :goto_0

    .line 602
    :cond_1
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {p2}, Landroid/support/v7/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    move v2, v3

    .line 603
    goto :goto_0

    .line 605
    :cond_2
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {p2}, Landroid/support/v7/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    move v2, v3

    .line 606
    goto :goto_0

    .line 608
    :cond_3
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 609
    .local v0, "p1Icon":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p2}, Landroid/support/v7/preference/Preference;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 610
    .local v1, "p2Icon":Landroid/graphics/drawable/Drawable;
    if-eq v0, v1, :cond_5

    if-eqz v0, :cond_4

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    :cond_4
    move v2, v3

    .line 611
    goto :goto_0

    .line 613
    :cond_5
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->isEnabled()Z

    move-result v2

    invoke-virtual {p2}, Landroid/support/v7/preference/Preference;->isEnabled()Z

    move-result v4

    if-eq v2, v4, :cond_6

    move v2, v3

    .line 614
    goto :goto_0

    .line 616
    :cond_6
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->isSelectable()Z

    move-result v2

    invoke-virtual {p2}, Landroid/support/v7/preference/Preference;->isSelectable()Z

    move-result v4

    if-eq v2, v4, :cond_7

    move v2, v3

    .line 617
    goto :goto_0

    .line 619
    :cond_7
    instance-of v2, p1, Landroid/support/v7/preference/TwoStatePreference;

    if-eqz v2, :cond_8

    move-object v2, p1

    .line 620
    check-cast v2, Landroid/support/v7/preference/TwoStatePreference;

    invoke-virtual {v2}, Landroid/support/v7/preference/TwoStatePreference;->isChecked()Z

    move-result v4

    move-object v2, p2

    check-cast v2, Landroid/support/v7/preference/TwoStatePreference;

    .line 621
    invoke-virtual {v2}, Landroid/support/v7/preference/TwoStatePreference;->isChecked()Z

    move-result v2

    if-eq v4, v2, :cond_8

    move v2, v3

    .line 622
    goto :goto_0

    .line 625
    :cond_8
    instance-of v2, p1, Landroid/support/v7/preference/DropDownPreference;

    if-eqz v2, :cond_9

    if-eq p1, p2, :cond_9

    move v2, v3

    .line 627
    goto :goto_0

    .line 630
    :cond_9
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public arePreferenceItemsTheSame(Landroid/support/v7/preference/Preference;Landroid/support/v7/preference/Preference;)Z
    .locals 4
    .param p1, "p1"    # Landroid/support/v7/preference/Preference;
    .param p2, "p2"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 580
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getId()J

    move-result-wide v0

    invoke-virtual {p2}, Landroid/support/v7/preference/Preference;->getId()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
