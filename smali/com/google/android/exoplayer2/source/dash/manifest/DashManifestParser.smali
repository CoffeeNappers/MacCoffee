.class public Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "DashManifestParser.java"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/ParsingLoadable$Parser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/xml/sax/helpers/DefaultHandler;",
        "Lcom/google/android/exoplayer2/upstream/ParsingLoadable$Parser",
        "<",
        "Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;",
        ">;"
    }
.end annotation


# static fields
.field private static final CEA_608_ACCESSIBILITY_PATTERN:Ljava/util/regex/Pattern;

.field private static final CEA_708_ACCESSIBILITY_PATTERN:Ljava/util/regex/Pattern;

.field private static final FRAME_RATE_PATTERN:Ljava/util/regex/Pattern;

.field private static final TAG:Ljava/lang/String; = "MpdParser"


# instance fields
.field private final contentId:Ljava/lang/String;

.field private final xmlParserFactory:Lorg/xmlpull/v1/XmlPullParserFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 59
    const-string/jumbo v0, "(\\d+)(?:/(\\d+))?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->FRAME_RATE_PATTERN:Ljava/util/regex/Pattern;

    .line 61
    const-string/jumbo v0, "CC([1-4])=.*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->CEA_608_ACCESSIBILITY_PATTERN:Ljava/util/regex/Pattern;

    .line 62
    const-string/jumbo v0, "([1-9]|[1-5][0-9]|6[0-3])=.*"

    .line 63
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->CEA_708_ACCESSIBILITY_PATTERN:Ljava/util/regex/Pattern;

    .line 62
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 72
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;-><init>(Ljava/lang/String;)V

    .line 73
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "contentId"    # Ljava/lang/String;

    .prologue
    .line 78
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 79
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->contentId:Ljava/lang/String;

    .line 81
    :try_start_0
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->xmlParserFactory:Lorg/xmlpull/v1/XmlPullParserFactory;
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    return-void

    .line 82
    :catch_0
    move-exception v0

    .line 83
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "Couldn\'t create XmlPullParserFactory instance"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static checkContentTypeConsistency(II)I
    .locals 1
    .param p0, "firstType"    # I
    .param p1, "secondType"    # I

    .prologue
    const/4 v0, -0x1

    .line 796
    if-ne p0, v0, :cond_1

    move p0, p1

    .line 802
    .end local p0    # "firstType":I
    :cond_0
    :goto_0
    return p0

    .line 798
    .restart local p0    # "firstType":I
    :cond_1
    if-eq p1, v0, :cond_0

    .line 801
    if-ne p0, p1, :cond_2

    const/4 v0, 0x1

    :goto_1
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private static checkLanguageConsistency(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "firstLanguage"    # Ljava/lang/String;
    .param p1, "secondLanguage"    # Ljava/lang/String;

    .prologue
    .line 774
    if-nez p0, :cond_1

    move-object p0, p1

    .line 780
    .end local p0    # "firstLanguage":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 776
    .restart local p0    # "firstLanguage":Ljava/lang/String;
    :cond_1
    if-eqz p1, :cond_0

    .line 779
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    goto :goto_0
.end method

.method private static getSampleMimeType(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "containerMimeType"    # Ljava/lang/String;
    .param p1, "codecs"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 724
    invoke-static {p0}, Lcom/google/android/exoplayer2/util/MimeTypes;->isAudio(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 725
    invoke-static {p1}, Lcom/google/android/exoplayer2/util/MimeTypes;->getAudioMediaMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 746
    .end local p0    # "containerMimeType":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 726
    .restart local p0    # "containerMimeType":Ljava/lang/String;
    :cond_1
    invoke-static {p0}, Lcom/google/android/exoplayer2/util/MimeTypes;->isVideo(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 727
    invoke-static {p1}, Lcom/google/android/exoplayer2/util/MimeTypes;->getVideoMediaMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 728
    :cond_2
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->mimeTypeIsRawText(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 730
    const-string/jumbo v1, "application/mp4"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 731
    const-string/jumbo v1, "stpp"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 732
    const-string/jumbo p0, "application/ttml+xml"

    goto :goto_0

    .line 733
    :cond_3
    const-string/jumbo v1, "wvtt"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 734
    const-string/jumbo p0, "application/x-mp4-vtt"

    goto :goto_0

    .line 736
    :cond_4
    const-string/jumbo v1, "application/x-rawcc"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 737
    if-eqz p1, :cond_7

    .line 738
    const-string/jumbo v1, "cea708"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 739
    const-string/jumbo p0, "application/cea-708"

    goto :goto_0

    .line 740
    :cond_5
    const-string/jumbo v1, "eia608"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string/jumbo v1, "cea608"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 741
    :cond_6
    const-string/jumbo p0, "application/cea-608"

    goto :goto_0

    :cond_7
    move-object p0, v0

    .line 744
    goto :goto_0

    :cond_8
    move-object p0, v0

    .line 746
    goto :goto_0
.end method

.method private static mimeTypeIsRawText(Ljava/lang/String;)Z
    .locals 1
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 756
    invoke-static {p0}, Lcom/google/android/exoplayer2/util/MimeTypes;->isText(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "application/ttml+xml"

    .line 757
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "application/x-mp4-vtt"

    .line 758
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "application/cea-708"

    .line 759
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "application/cea-608"

    .line 760
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected static parseBaseUrl(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "parentBaseUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 898
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 899
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/android/exoplayer2/util/UriUtil;->resolve(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected static parseCea608AccessibilityChannel(Ljava/util/List;)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 827
    .local p0, "accessibilityDescriptors":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 828
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;

    .line 829
    .local v1, "descriptor":Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;
    const-string/jumbo v3, "urn:scte:dash:cc:cea-608:2015"

    iget-object v4, v1, Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;->schemeIdUri:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, v1, Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;->value:Ljava/lang/String;

    if-eqz v3, :cond_1

    .line 831
    sget-object v3, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->CEA_608_ACCESSIBILITY_PATTERN:Ljava/util/regex/Pattern;

    iget-object v4, v1, Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;->value:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 832
    .local v0, "accessibilityValueMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 833
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 839
    .end local v0    # "accessibilityValueMatcher":Ljava/util/regex/Matcher;
    .end local v1    # "descriptor":Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;
    :goto_1
    return v3

    .line 835
    .restart local v0    # "accessibilityValueMatcher":Ljava/util/regex/Matcher;
    .restart local v1    # "descriptor":Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;
    :cond_0
    const-string/jumbo v3, "MpdParser"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Unable to parse CEA-608 channel number from: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;->value:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 827
    .end local v0    # "accessibilityValueMatcher":Ljava/util/regex/Matcher;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 839
    .end local v1    # "descriptor":Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;
    :cond_2
    const/4 v3, -0x1

    goto :goto_1
.end method

.method protected static parseCea708AccessibilityChannel(Ljava/util/List;)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 844
    .local p0, "accessibilityDescriptors":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 845
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;

    .line 846
    .local v1, "descriptor":Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;
    const-string/jumbo v3, "urn:scte:dash:cc:cea-708:2015"

    iget-object v4, v1, Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;->schemeIdUri:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, v1, Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;->value:Ljava/lang/String;

    if-eqz v3, :cond_1

    .line 848
    sget-object v3, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->CEA_708_ACCESSIBILITY_PATTERN:Ljava/util/regex/Pattern;

    iget-object v4, v1, Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;->value:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 849
    .local v0, "accessibilityValueMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 850
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 856
    .end local v0    # "accessibilityValueMatcher":Ljava/util/regex/Matcher;
    .end local v1    # "descriptor":Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;
    :goto_1
    return v3

    .line 852
    .restart local v0    # "accessibilityValueMatcher":Ljava/util/regex/Matcher;
    .restart local v1    # "descriptor":Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;
    :cond_0
    const-string/jumbo v3, "MpdParser"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Unable to parse CEA-708 service block number from: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;->value:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 844
    .end local v0    # "accessibilityValueMatcher":Ljava/util/regex/Matcher;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 856
    .end local v1    # "descriptor":Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;
    :cond_2
    const/4 v3, -0x1

    goto :goto_1
.end method

.method protected static parseDateTime(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J
    .locals 2
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .prologue
    .line 888
    const/4 v1, 0x0

    invoke-interface {p0, v1, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 889
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 892
    .end local p2    # "defaultValue":J
    :goto_0
    return-wide p2

    .restart local p2    # "defaultValue":J
    :cond_0
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Util;->parseXsDateTime(Ljava/lang/String;)J

    move-result-wide p2

    goto :goto_0
.end method

.method protected static parseDuration(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J
    .locals 2
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # J

    .prologue
    .line 878
    const/4 v1, 0x0

    invoke-interface {p0, v1, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 879
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 882
    .end local p2    # "defaultValue":J
    :goto_0
    return-wide p2

    .restart local p2    # "defaultValue":J
    :cond_0
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Util;->parseXsDuration(Ljava/lang/String;)J

    move-result-wide p2

    goto :goto_0
.end method

.method protected static parseFrameRate(Lorg/xmlpull/v1/XmlPullParser;F)F
    .locals 7
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "defaultValue"    # F

    .prologue
    .line 860
    move v1, p1

    .line 861
    .local v1, "frameRate":F
    const/4 v5, 0x0

    const-string/jumbo v6, "frameRate"

    invoke-interface {p0, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 862
    .local v2, "frameRateAttribute":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 863
    sget-object v5, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->FRAME_RATE_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v5, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 864
    .local v3, "frameRateMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 865
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 866
    .local v4, "numerator":I
    const/4 v5, 0x2

    invoke-virtual {v3, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    .line 867
    .local v0, "denominatorString":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 868
    int-to-float v5, v4

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    int-to-float v6, v6

    div-float v1, v5, v6

    .line 874
    .end local v0    # "denominatorString":Ljava/lang/String;
    .end local v3    # "frameRateMatcher":Ljava/util/regex/Matcher;
    .end local v4    # "numerator":I
    :cond_0
    :goto_0
    return v1

    .line 870
    .restart local v0    # "denominatorString":Ljava/lang/String;
    .restart local v3    # "frameRateMatcher":Ljava/util/regex/Matcher;
    .restart local v4    # "numerator":I
    :cond_1
    int-to-float v1, v4

    goto :goto_0
.end method

.method protected static parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I
    .locals 2
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    .line 903
    const/4 v1, 0x0

    invoke-interface {p0, v1, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 904
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .end local p2    # "defaultValue":I
    :goto_0
    return p2

    .restart local p2    # "defaultValue":I
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    goto :goto_0
.end method

.method protected static parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J
    .locals 2
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # J

    .prologue
    .line 908
    const/4 v1, 0x0

    invoke-interface {p0, v1, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 909
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .end local p2    # "defaultValue":J
    :goto_0
    return-wide p2

    .restart local p2    # "defaultValue":J
    :cond_0
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p2

    goto :goto_0
.end method

.method protected static parseSchemeValuePair(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;
    .locals 4
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 817
    const-string/jumbo v2, "schemeIdUri"

    invoke-static {p0, v2, v3}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseString(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 818
    .local v0, "schemeIdUri":Ljava/lang/String;
    const-string/jumbo v2, "value"

    invoke-static {p0, v2, v3}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseString(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 820
    .local v1, "value":Ljava/lang/String;
    :cond_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 821
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 822
    new-instance v2, Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;

    invoke-direct {v2, v0, v1}, Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2
.end method

.method protected static parseString(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 913
    const/4 v1, 0x0

    invoke-interface {p0, v1, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 914
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .end local p2    # "defaultValue":Ljava/lang/String;
    :goto_0
    return-object p2

    .restart local p2    # "defaultValue":Ljava/lang/String;
    :cond_0
    move-object p2, v0

    goto :goto_0
.end method


# virtual methods
.method protected buildAdaptationSet(IILjava/util/List;Ljava/util/List;)Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;
    .locals 1
    .param p1, "id"    # I
    .param p2, "contentType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/source/dash/manifest/Representation;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;",
            ">;)",
            "Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;"
        }
    .end annotation

    .prologue
    .line 301
    .local p3, "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/Representation;>;"
    .local p4, "accessibilityDescriptors":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;>;"
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;-><init>(IILjava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method protected buildFormat(Ljava/lang/String;Ljava/lang/String;IIFIIILjava/lang/String;ILjava/util/List;Ljava/lang/String;)Lcom/google/android/exoplayer2/Format;
    .locals 11
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "containerMimeType"    # Ljava/lang/String;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "frameRate"    # F
    .param p6, "audioChannels"    # I
    .param p7, "audioSamplingRate"    # I
    .param p8, "bitrate"    # I
    .param p9, "language"    # Ljava/lang/String;
    .param p10, "selectionFlags"    # I
    .param p12, "codecs"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "IIFIII",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/exoplayer2/Format;"
        }
    .end annotation

    .prologue
    .line 480
    .local p11, "accessibilityDescriptors":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;>;"
    move-object/from16 v0, p12

    invoke-static {p2, v0}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->getSampleMimeType(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 481
    .local v3, "sampleMimeType":Ljava/lang/String;
    if-eqz v3, :cond_4

    .line 482
    invoke-static {v3}, Lcom/google/android/exoplayer2/util/MimeTypes;->isVideo(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 483
    const/4 v9, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object/from16 v4, p12

    move/from16 v5, p8

    move v6, p3

    move v7, p4

    move/from16 v8, p5

    move/from16 v10, p10

    invoke-static/range {v1 .. v10}, Lcom/google/android/exoplayer2/Format;->createVideoContainerFormat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIFLjava/util/List;I)Lcom/google/android/exoplayer2/Format;

    move-result-object v1

    .line 501
    :goto_0
    return-object v1

    .line 485
    :cond_0
    invoke-static {v3}, Lcom/google/android/exoplayer2/util/MimeTypes;->isAudio(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 486
    const/4 v8, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object/from16 v4, p12

    move/from16 v5, p8

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v9, p10

    move-object/from16 v10, p9

    invoke-static/range {v1 .. v10}, Lcom/google/android/exoplayer2/Format;->createAudioContainerFormat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIILjava/util/List;ILjava/lang/String;)Lcom/google/android/exoplayer2/Format;

    move-result-object v1

    goto :goto_0

    .line 488
    :cond_1
    invoke-static {v3}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->mimeTypeIsRawText(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 490
    const-string/jumbo v1, "application/cea-608"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 491
    invoke-static/range {p11 .. p11}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseCea608AccessibilityChannel(Ljava/util/List;)I

    move-result v8

    .local v8, "accessibilityChannel":I
    :goto_1
    move-object v1, p1

    move-object v2, p2

    move-object/from16 v4, p12

    move/from16 v5, p8

    move/from16 v6, p10

    move-object/from16 v7, p9

    .line 497
    invoke-static/range {v1 .. v8}, Lcom/google/android/exoplayer2/Format;->createTextContainerFormat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;I)Lcom/google/android/exoplayer2/Format;

    move-result-object v1

    goto :goto_0

    .line 492
    .end local v8    # "accessibilityChannel":I
    :cond_2
    const-string/jumbo v1, "application/cea-708"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 493
    invoke-static/range {p11 .. p11}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseCea708AccessibilityChannel(Ljava/util/List;)I

    move-result v8

    .restart local v8    # "accessibilityChannel":I
    goto :goto_1

    .line 495
    .end local v8    # "accessibilityChannel":I
    :cond_3
    const/4 v8, -0x1

    .restart local v8    # "accessibilityChannel":I
    goto :goto_1

    .end local v8    # "accessibilityChannel":I
    :cond_4
    move-object v1, p1

    move-object v2, p2

    move-object/from16 v4, p12

    move/from16 v5, p8

    move/from16 v6, p10

    move-object/from16 v7, p9

    .line 501
    invoke-static/range {v1 .. v7}, Lcom/google/android/exoplayer2/Format;->createContainerFormat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)Lcom/google/android/exoplayer2/Format;

    move-result-object v1

    goto :goto_0
.end method

.method protected buildMediaPresentationDescription(JJJZJJJLcom/google/android/exoplayer2/source/dash/manifest/UtcTimingElement;Landroid/net/Uri;Ljava/util/List;)Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;
    .locals 17
    .param p1, "availabilityStartTime"    # J
    .param p3, "durationMs"    # J
    .param p5, "minBufferTimeMs"    # J
    .param p7, "dynamic"    # Z
    .param p8, "minUpdateTimeMs"    # J
    .param p10, "timeShiftBufferDepthMs"    # J
    .param p12, "suggestedPresentationDelayMs"    # J
    .param p14, "utcTiming"    # Lcom/google/android/exoplayer2/source/dash/manifest/UtcTimingElement;
    .param p15, "location"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJJZJJJ",
            "Lcom/google/android/exoplayer2/source/dash/manifest/UtcTimingElement;",
            "Landroid/net/Uri;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/source/dash/manifest/Period;",
            ">;)",
            "Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;"
        }
    .end annotation

    .prologue
    .line 178
    .local p16, "periods":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/Period;>;"
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;

    move-wide/from16 v1, p1

    move-wide/from16 v3, p3

    move-wide/from16 v5, p5

    move/from16 v7, p7

    move-wide/from16 v8, p8

    move-wide/from16 v10, p10

    move-wide/from16 v12, p12

    move-object/from16 v14, p14

    move-object/from16 v15, p15

    move-object/from16 v16, p16

    invoke-direct/range {v0 .. v16}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;-><init>(JJJZJJJLcom/google/android/exoplayer2/source/dash/manifest/UtcTimingElement;Landroid/net/Uri;Ljava/util/List;)V

    return-object v0
.end method

.method protected buildPeriod(Ljava/lang/String;JLjava/util/List;)Lcom/google/android/exoplayer2/source/dash/manifest/Period;
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "startMs"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;",
            ">;)",
            "Lcom/google/android/exoplayer2/source/dash/manifest/Period;"
        }
    .end annotation

    .prologue
    .line 223
    .local p4, "adaptationSets":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;>;"
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/manifest/Period;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/google/android/exoplayer2/source/dash/manifest/Period;-><init>(Ljava/lang/String;JLjava/util/List;)V

    return-object v0
.end method

.method protected buildRangedUri(Ljava/lang/String;JJ)Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .locals 6
    .param p1, "urlText"    # Ljava/lang/String;
    .param p2, "rangeStart"    # J
    .param p4, "rangeLength"    # J

    .prologue
    .line 698
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;-><init>(Ljava/lang/String;JJ)V

    return-object v0
.end method

.method protected buildRepresentation(Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)Lcom/google/android/exoplayer2/source/dash/manifest/Representation;
    .locals 8
    .param p1, "representationInfo"    # Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;
    .param p2, "contentId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;",
            ">;)",
            "Lcom/google/android/exoplayer2/source/dash/manifest/Representation;"
        }
    .end annotation

    .prologue
    .line 508
    .local p3, "extraDrmSchemeDatas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;>;"
    .local p4, "extraInbandEventStreams":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;>;"
    iget-object v4, p1, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;->format:Lcom/google/android/exoplayer2/Format;

    .line 509
    .local v4, "format":Lcom/google/android/exoplayer2/Format;
    iget-object v0, p1, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;->drmSchemeDatas:Ljava/util/ArrayList;

    .line 510
    .local v0, "drmSchemeDatas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;>;"
    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 511
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 512
    new-instance v1, Lcom/google/android/exoplayer2/drm/DrmInitData;

    invoke-direct {v1, v0}, Lcom/google/android/exoplayer2/drm/DrmInitData;-><init>(Ljava/util/List;)V

    invoke-virtual {v4, v1}, Lcom/google/android/exoplayer2/Format;->copyWithDrmInitData(Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/Format;

    move-result-object v4

    .line 514
    :cond_0
    iget-object v7, p1, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;->inbandEventStreams:Ljava/util/ArrayList;

    .line 515
    .local v7, "inbandEventStremas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;>;"
    invoke-virtual {v7, p4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 516
    const-wide/16 v2, -0x1

    iget-object v5, p1, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;->baseUrl:Ljava/lang/String;

    iget-object v6, p1, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;->segmentBase:Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;

    move-object v1, p2

    invoke-static/range {v1 .. v7}, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;->newInstance(Ljava/lang/String;JLcom/google/android/exoplayer2/Format;Ljava/lang/String;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;Ljava/util/List;)Lcom/google/android/exoplayer2/source/dash/manifest/Representation;

    move-result-object v1

    return-object v1
.end method

.method protected buildSegmentList(Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;JJIJLjava/util/List;Ljava/util/List;)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;
    .locals 12
    .param p1, "initialization"    # Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .param p2, "timescale"    # J
    .param p4, "presentationTimeOffset"    # J
    .param p6, "startNumber"    # I
    .param p7, "duration"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;",
            "JJIJ",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTimelineElement;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;",
            ">;)",
            "Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;"
        }
    .end annotation

    .prologue
    .line 596
    .local p9, "timeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTimelineElement;>;"
    .local p10, "segments":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;>;"
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;

    move-object v1, p1

    move-wide v2, p2

    move-wide/from16 v4, p4

    move/from16 v6, p6

    move-wide/from16 v7, p7

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    invoke-direct/range {v0 .. v10}, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;-><init>(Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;JJIJLjava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method protected buildSegmentTemplate(Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;JJIJLjava/util/List;Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;
    .locals 12
    .param p1, "initialization"    # Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .param p2, "timescale"    # J
    .param p4, "presentationTimeOffset"    # J
    .param p6, "startNumber"    # I
    .param p7, "duration"    # J
    .param p10, "initializationTemplate"    # Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;
    .param p11, "mediaTemplate"    # Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;",
            "JJIJ",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTimelineElement;",
            ">;",
            "Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;",
            "Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;",
            ")",
            "Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;"
        }
    .end annotation

    .prologue
    .line 637
    .local p9, "timeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTimelineElement;>;"
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;

    move-object v1, p1

    move-wide v2, p2

    move-wide/from16 v4, p4

    move/from16 v6, p6

    move-wide/from16 v7, p7

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    invoke-direct/range {v0 .. v11}, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;-><init>(Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;JJIJLjava/util/List;Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;)V

    return-object v0
.end method

.method protected buildSegmentTimelineElement(JJ)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTimelineElement;
    .locals 1
    .param p1, "elapsedTime"    # J
    .param p3, "duration"    # J

    .prologue
    .line 661
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTimelineElement;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTimelineElement;-><init>(JJ)V

    return-object v0
.end method

.method protected buildSingleSegmentBase(Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;JJJJ)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;
    .locals 10
    .param p1, "initialization"    # Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .param p2, "timescale"    # J
    .param p4, "presentationTimeOffset"    # J
    .param p6, "indexStart"    # J
    .param p8, "indexLength"    # J

    .prologue
    .line 552
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    move-wide/from16 v6, p6

    move-wide/from16 v8, p8

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;-><init>(Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;JJJJ)V

    return-object v0
.end method

.method protected buildUtcTimingElement(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/exoplayer2/source/dash/manifest/UtcTimingElement;
    .locals 1
    .param p1, "schemeIdUri"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 190
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/manifest/UtcTimingElement;

    invoke-direct {v0, p1, p2}, Lcom/google/android/exoplayer2/source/dash/manifest/UtcTimingElement;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method protected getContentType(Lcom/google/android/exoplayer2/Format;)I
    .locals 3
    .param p1, "format"    # Lcom/google/android/exoplayer2/Format;

    .prologue
    const/4 v1, -0x1

    .line 314
    iget-object v0, p1, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    .line 315
    .local v0, "sampleMimeType":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 324
    :cond_0
    :goto_0
    return v1

    .line 317
    :cond_1
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/MimeTypes;->isVideo(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 318
    const/4 v1, 0x2

    goto :goto_0

    .line 319
    :cond_2
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/MimeTypes;->isAudio(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 320
    const/4 v1, 0x1

    goto :goto_0

    .line 321
    :cond_3
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->mimeTypeIsRawText(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 322
    const/4 v1, 0x3

    goto :goto_0
.end method

.method public parse(Landroid/net/Uri;Ljava/io/InputStream;)Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    :try_start_0
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->xmlParserFactory:Lorg/xmlpull/v1/XmlPullParserFactory;

    invoke-virtual {v3}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v2

    .line 93
    .local v2, "xpp":Lorg/xmlpull/v1/XmlPullParser;
    const/4 v3, 0x0

    invoke-interface {v2, p2, v3}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 94
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 95
    .local v1, "eventType":I
    const/4 v3, 0x2

    if-ne v1, v3, :cond_0

    const-string/jumbo v3, "MPD"

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 96
    :cond_0
    new-instance v3, Lcom/google/android/exoplayer2/ParserException;

    const-string/jumbo v4, "inputStream does not contain a valid media presentation description"

    invoke-direct {v3, v4}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    .end local v1    # "eventType":I
    .end local v2    # "xpp":Lorg/xmlpull/v1/XmlPullParser;
    :catch_0
    move-exception v0

    .line 101
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    new-instance v3, Lcom/google/android/exoplayer2/ParserException;

    invoke-direct {v3, v0}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 99
    .end local v0    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v1    # "eventType":I
    .restart local v2    # "xpp":Lorg/xmlpull/v1/XmlPullParser;
    :cond_1
    :try_start_1
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseMediaPresentationDescription(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    return-object v3
.end method

.method public bridge synthetic parse(Landroid/net/Uri;Ljava/io/InputStream;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parse(Landroid/net/Uri;Ljava/io/InputStream;)Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;

    move-result-object v0

    return-object v0
.end method

.method protected parseAccessibility(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;
    .locals 1
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 387
    const-string/jumbo v0, "Accessibility"

    invoke-static {p1, v0}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseSchemeValuePair(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;

    move-result-object v0

    return-object v0
.end method

.method protected parseAdaptationSet(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;)Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;
    .locals 29
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "baseUrl"    # Ljava/lang/String;
    .param p3, "segmentBase"    # Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 230
    const-string/jumbo v5, "id"

    const/4 v6, -0x1

    move-object/from16 v0, p1

    invoke-static {v0, v5, v6}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v23

    .line 231
    .local v23, "id":I
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseContentType(Lorg/xmlpull/v1/XmlPullParser;)I

    move-result v20

    .line 233
    .local v20, "contentType":I
    const/4 v5, 0x0

    const-string/jumbo v6, "mimeType"

    move-object/from16 v0, p1

    invoke-interface {v0, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 234
    .local v8, "mimeType":Ljava/lang/String;
    const/4 v5, 0x0

    const-string/jumbo v6, "codecs"

    move-object/from16 v0, p1

    invoke-interface {v0, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 235
    .local v9, "codecs":Ljava/lang/String;
    const-string/jumbo v5, "width"

    const/4 v6, -0x1

    move-object/from16 v0, p1

    invoke-static {v0, v5, v6}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v10

    .line 236
    .local v10, "width":I
    const-string/jumbo v5, "height"

    const/4 v6, -0x1

    move-object/from16 v0, p1

    invoke-static {v0, v5, v6}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v11

    .line 237
    .local v11, "height":I
    const/high16 v5, -0x40800000    # -1.0f

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseFrameRate(Lorg/xmlpull/v1/XmlPullParser;F)F

    move-result v12

    .line 238
    .local v12, "frameRate":F
    const/4 v13, -0x1

    .line 239
    .local v13, "audioChannels":I
    const-string/jumbo v5, "audioSamplingRate"

    const/4 v6, -0x1

    move-object/from16 v0, p1

    invoke-static {v0, v5, v6}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v14

    .line 240
    .local v14, "audioSamplingRate":I
    const/4 v5, 0x0

    const-string/jumbo v6, "lang"

    move-object/from16 v0, p1

    invoke-interface {v0, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 241
    .local v15, "language":Ljava/lang/String;
    new-instance v21, Ljava/util/ArrayList;

    invoke-direct/range {v21 .. v21}, Ljava/util/ArrayList;-><init>()V

    .line 242
    .local v21, "drmSchemeDatas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;>;"
    new-instance v24, Ljava/util/ArrayList;

    invoke-direct/range {v24 .. v24}, Ljava/util/ArrayList;-><init>()V

    .line 243
    .local v24, "inbandEventStreams":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;>;"
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 244
    .local v17, "accessibilityDescriptors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;>;"
    new-instance v26, Ljava/util/ArrayList;

    invoke-direct/range {v26 .. v26}, Ljava/util/ArrayList;-><init>()V

    .line 245
    .local v26, "representationInfos":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;>;"
    const/16 v16, 0x0

    .line 247
    .local v16, "selectionFlags":I
    const/16 v28, 0x0

    .line 249
    .local v28, "seenFirstBaseUrl":Z
    :cond_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 250
    const-string/jumbo v5, "BaseURL"

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 251
    if-nez v28, :cond_1

    .line 252
    invoke-static/range {p1 .. p2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseBaseUrl(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 253
    const/16 v28, 0x1

    .line 287
    :cond_1
    :goto_0
    const-string/jumbo v5, "AdaptationSet"

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 290
    new-instance v27, Ljava/util/ArrayList;

    invoke-interface/range {v26 .. v26}, Ljava/util/List;->size()I

    move-result v5

    move-object/from16 v0, v27

    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 291
    .local v27, "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/Representation;>;"
    const/16 v22, 0x0

    .local v22, "i":I
    :goto_1
    invoke-interface/range {v26 .. v26}, Ljava/util/List;->size()I

    move-result v5

    move/from16 v0, v22

    if-ge v0, v5, :cond_d

    .line 292
    move-object/from16 v0, v26

    move/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->contentId:Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v24

    invoke-virtual {v0, v5, v6, v1, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->buildRepresentation(Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)Lcom/google/android/exoplayer2/source/dash/manifest/Representation;

    move-result-object v5

    move-object/from16 v0, v27

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 291
    add-int/lit8 v22, v22, 0x1

    goto :goto_1

    .line 255
    .end local v22    # "i":I
    .end local v27    # "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/Representation;>;"
    :cond_2
    const-string/jumbo v5, "ContentProtection"

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 256
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseContentProtection(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;

    move-result-object v19

    .line 257
    .local v19, "contentProtection":Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;
    if-eqz v19, :cond_1

    .line 258
    move-object/from16 v0, v21

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 260
    .end local v19    # "contentProtection":Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;
    :cond_3
    const-string/jumbo v5, "ContentComponent"

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 261
    const/4 v5, 0x0

    const-string/jumbo v6, "lang"

    move-object/from16 v0, p1

    invoke-interface {v0, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v15, v5}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->checkLanguageConsistency(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 262
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseContentType(Lorg/xmlpull/v1/XmlPullParser;)I

    move-result v5

    move/from16 v0, v20

    invoke-static {v0, v5}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->checkContentTypeConsistency(II)I

    move-result v20

    goto :goto_0

    .line 263
    :cond_4
    const-string/jumbo v5, "Role"

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 264
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseRole(Lorg/xmlpull/v1/XmlPullParser;)I

    move-result v5

    or-int v16, v16, v5

    goto/16 :goto_0

    .line 265
    :cond_5
    const-string/jumbo v5, "AudioChannelConfiguration"

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 266
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseAudioChannelConfiguration(Lorg/xmlpull/v1/XmlPullParser;)I

    move-result v13

    goto/16 :goto_0

    .line 267
    :cond_6
    const-string/jumbo v5, "Accessibility"

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 268
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseAccessibility(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;

    move-result-object v5

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 269
    :cond_7
    const-string/jumbo v5, "Representation"

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move-object/from16 v18, p3

    .line 270
    invoke-virtual/range {v5 .. v18}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseRepresentation(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIFIILjava/lang/String;ILjava/util/List;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;)Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;

    move-result-object v25

    .line 273
    .local v25, "representationInfo":Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;
    move-object/from16 v0, v25

    iget-object v5, v0, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;->format:Lcom/google/android/exoplayer2/Format;

    .line 274
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->getContentType(Lcom/google/android/exoplayer2/Format;)I

    move-result v5

    .line 273
    move/from16 v0, v20

    invoke-static {v0, v5}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->checkContentTypeConsistency(II)I

    move-result v20

    .line 275
    move-object/from16 v0, v26

    move-object/from16 v1, v25

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 276
    .end local v25    # "representationInfo":Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;
    :cond_8
    const-string/jumbo v5, "SegmentBase"

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 277
    check-cast p3, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;

    .end local p3    # "segmentBase":Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseSegmentBase(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;

    move-result-object p3

    .restart local p3    # "segmentBase":Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;
    goto/16 :goto_0

    .line 278
    :cond_9
    const-string/jumbo v5, "SegmentList"

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 279
    check-cast p3, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;

    .end local p3    # "segmentBase":Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseSegmentList(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;

    move-result-object p3

    .restart local p3    # "segmentBase":Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;
    goto/16 :goto_0

    .line 280
    :cond_a
    const-string/jumbo v5, "SegmentTemplate"

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 281
    check-cast p3, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;

    .end local p3    # "segmentBase":Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseSegmentTemplate(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;

    move-result-object p3

    .restart local p3    # "segmentBase":Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;
    goto/16 :goto_0

    .line 282
    :cond_b
    const-string/jumbo v5, "InbandEventStream"

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 283
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseInbandEventStream(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;

    move-result-object v5

    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 284
    :cond_c
    invoke-static/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 285
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseAdaptationSetChild(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 296
    .restart local v22    # "i":I
    .restart local v27    # "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/Representation;>;"
    :cond_d
    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v20

    move-object/from16 v3, v27

    move-object/from16 v4, v17

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->buildAdaptationSet(IILjava/util/List;Ljava/util/List;)Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;

    move-result-object v5

    return-object v5
.end method

.method protected parseAdaptationSetChild(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 0
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 418
    return-void
.end method

.method protected parseAudioChannelConfiguration(Lorg/xmlpull/v1/XmlPullParser;)I
    .locals 4
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, -0x1

    .line 705
    const-string/jumbo v2, "schemeIdUri"

    const/4 v3, 0x0

    invoke-static {p1, v2, v3}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseString(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 706
    .local v1, "schemeIdUri":Ljava/lang/String;
    const-string/jumbo v2, "urn:mpeg:dash:23003:3:audio_channel_configuration:2011"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string/jumbo v2, "value"

    .line 707
    invoke-static {p1, v2, v0}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v0

    .line 709
    .local v0, "audioChannels":I
    :cond_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 710
    const-string/jumbo v2, "AudioChannelConfiguration"

    invoke-static {p1, v2}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 711
    return v0
.end method

.method protected parseContentProtection(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;
    .locals 9
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 338
    const/4 v0, 0x0

    .line 339
    .local v0, "data":[B
    const/4 v4, 0x0

    .line 340
    .local v4, "uuid":Ljava/util/UUID;
    const/4 v3, 0x0

    .line 341
    .local v3, "seenPsshElement":Z
    const/4 v1, 0x0

    .line 343
    .local v1, "requiresSecureDecoder":Z
    :cond_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 345
    const-string/jumbo v7, "cenc:pssh"

    invoke-static {p1, v7}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v7

    const/4 v8, 0x4

    if-ne v7, v8, :cond_2

    .line 346
    const/4 v3, 0x1

    .line 347
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v5}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    .line 348
    invoke-static {v0}, Lcom/google/android/exoplayer2/extractor/mp4/PsshAtomUtil;->parseUuid([B)Ljava/util/UUID;

    move-result-object v4

    .line 353
    :cond_1
    :goto_0
    const-string/jumbo v7, "ContentProtection"

    invoke-static {p1, v7}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 354
    if-nez v3, :cond_4

    move-object v5, v6

    .line 360
    :goto_1
    return-object v5

    .line 349
    :cond_2
    const-string/jumbo v7, "widevine:license"

    invoke-static {p1, v7}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 350
    const-string/jumbo v7, "robustness_level"

    invoke-interface {p1, v6, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 351
    .local v2, "robustnessLevel":Ljava/lang/String;
    if-eqz v2, :cond_3

    const-string/jumbo v7, "HW"

    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    const/4 v1, 0x1

    :goto_2
    goto :goto_0

    :cond_3
    move v1, v5

    goto :goto_2

    .line 356
    .end local v2    # "robustnessLevel":Ljava/lang/String;
    :cond_4
    if-eqz v4, :cond_5

    .line 357
    new-instance v5, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;

    const-string/jumbo v6, "video/mp4"

    invoke-direct {v5, v4, v6, v0, v1}, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;-><init>(Ljava/util/UUID;Ljava/lang/String;[BZ)V

    goto :goto_1

    .line 359
    :cond_5
    const-string/jumbo v5, "MpdParser"

    const-string/jumbo v7, "Skipped unsupported ContentProtection element"

    invoke-static {v5, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v5, v6

    .line 360
    goto :goto_1
.end method

.method protected parseContentType(Lorg/xmlpull/v1/XmlPullParser;)I
    .locals 4
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    const/4 v1, -0x1

    .line 305
    const/4 v2, 0x0

    const-string/jumbo v3, "contentType"

    invoke-interface {p1, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 306
    .local v0, "contentType":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 309
    :cond_0
    :goto_0
    return v1

    .line 306
    :cond_1
    const-string/jumbo v2, "audio"

    .line 307
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    const-string/jumbo v2, "video"

    .line 308
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v1, 0x2

    goto :goto_0

    :cond_3
    const-string/jumbo v2, "text"

    .line 309
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x3

    goto :goto_0
.end method

.method protected parseInbandEventStream(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;
    .locals 1
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 374
    const-string/jumbo v0, "InbandEventStream"

    invoke-static {p1, v0}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseSchemeValuePair(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;

    move-result-object v0

    return-object v0
.end method

.method protected parseInitialization(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .locals 2
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    .line 674
    const-string/jumbo v0, "sourceURL"

    const-string/jumbo v1, "range"

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseRangedUrl(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    move-result-object v0

    return-object v0
.end method

.method protected parseMediaPresentationDescription(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;
    .locals 36
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "baseUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    const-string/jumbo v6, "availabilityStartTime"

    const-wide v32, -0x7fffffffffffffffL    # -4.9E-324

    move-object/from16 v0, p1

    move-wide/from16 v1, v32

    invoke-static {v0, v6, v1, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseDateTime(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v7

    .line 108
    .local v7, "availabilityStartTime":J
    const-string/jumbo v6, "mediaPresentationDuration"

    const-wide v32, -0x7fffffffffffffffL    # -4.9E-324

    move-object/from16 v0, p1

    move-wide/from16 v1, v32

    invoke-static {v0, v6, v1, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseDuration(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v9

    .line 109
    .local v9, "durationMs":J
    const-string/jumbo v6, "minBufferTime"

    const-wide v32, -0x7fffffffffffffffL    # -4.9E-324

    move-object/from16 v0, p1

    move-wide/from16 v1, v32

    invoke-static {v0, v6, v1, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseDuration(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v11

    .line 110
    .local v11, "minBufferTimeMs":J
    const/4 v6, 0x0

    const-string/jumbo v32, "type"

    move-object/from16 v0, p1

    move-object/from16 v1, v32

    invoke-interface {v0, v6, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    .line 111
    .local v31, "typeString":Ljava/lang/String;
    if-eqz v31, :cond_3

    const-string/jumbo v6, "dynamic"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    const/4 v13, 0x1

    .line 112
    .local v13, "dynamic":Z
    :goto_0
    if-eqz v13, :cond_4

    const-string/jumbo v6, "minimumUpdatePeriod"

    const-wide v32, -0x7fffffffffffffffL    # -4.9E-324

    move-object/from16 v0, p1

    move-wide/from16 v1, v32

    invoke-static {v0, v6, v1, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseDuration(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v14

    .line 114
    .local v14, "minUpdateTimeMs":J
    :goto_1
    if-eqz v13, :cond_5

    const-string/jumbo v6, "timeShiftBufferDepth"

    const-wide v32, -0x7fffffffffffffffL    # -4.9E-324

    .line 115
    move-object/from16 v0, p1

    move-wide/from16 v1, v32

    invoke-static {v0, v6, v1, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseDuration(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v16

    .line 116
    .local v16, "timeShiftBufferDepthMs":J
    :goto_2
    if-eqz v13, :cond_6

    const-string/jumbo v6, "suggestedPresentationDelay"

    const-wide v32, -0x7fffffffffffffffL    # -4.9E-324

    .line 117
    move-object/from16 v0, p1

    move-wide/from16 v1, v32

    invoke-static {v0, v6, v1, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseDuration(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v18

    .line 118
    .local v18, "suggestedPresentationDelayMs":J
    :goto_3
    const/16 v20, 0x0

    .line 119
    .local v20, "utcTiming":Lcom/google/android/exoplayer2/source/dash/manifest/UtcTimingElement;
    const/16 v21, 0x0

    .line 121
    .local v21, "location":Landroid/net/Uri;
    new-instance v22, Ljava/util/ArrayList;

    invoke-direct/range {v22 .. v22}, Ljava/util/ArrayList;-><init>()V

    .line 122
    .local v22, "periods":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/Period;>;"
    if-eqz v13, :cond_7

    const-wide v24, -0x7fffffffffffffffL    # -4.9E-324

    .line 123
    .local v24, "nextPeriodStartMs":J
    :goto_4
    const/16 v29, 0x0

    .line 124
    .local v29, "seenEarlyAccessPeriod":Z
    const/16 v30, 0x0

    .line 126
    .local v30, "seenFirstBaseUrl":Z
    :cond_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 127
    const-string/jumbo v6, "BaseURL"

    move-object/from16 v0, p1

    invoke-static {v0, v6}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 128
    if-nez v30, :cond_1

    .line 129
    invoke-static/range {p1 .. p2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseBaseUrl(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 130
    const/16 v30, 0x1

    .line 154
    :cond_1
    :goto_5
    const-string/jumbo v6, "MPD"

    move-object/from16 v0, p1

    invoke-static {v0, v6}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 156
    const-wide v32, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v6, v9, v32

    if-nez v6, :cond_2

    .line 157
    const-wide v32, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v6, v24, v32

    if-eqz v6, :cond_e

    .line 159
    move-wide/from16 v9, v24

    .line 165
    :cond_2
    invoke-interface/range {v22 .. v22}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_f

    .line 166
    new-instance v6, Lcom/google/android/exoplayer2/ParserException;

    const-string/jumbo v32, "No periods found."

    move-object/from16 v0, v32

    invoke-direct {v6, v0}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 111
    .end local v13    # "dynamic":Z
    .end local v14    # "minUpdateTimeMs":J
    .end local v16    # "timeShiftBufferDepthMs":J
    .end local v18    # "suggestedPresentationDelayMs":J
    .end local v20    # "utcTiming":Lcom/google/android/exoplayer2/source/dash/manifest/UtcTimingElement;
    .end local v21    # "location":Landroid/net/Uri;
    .end local v22    # "periods":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/Period;>;"
    .end local v24    # "nextPeriodStartMs":J
    .end local v29    # "seenEarlyAccessPeriod":Z
    .end local v30    # "seenFirstBaseUrl":Z
    :cond_3
    const/4 v13, 0x0

    goto/16 :goto_0

    .line 112
    .restart local v13    # "dynamic":Z
    :cond_4
    const-wide v14, -0x7fffffffffffffffL    # -4.9E-324

    goto/16 :goto_1

    .line 115
    .restart local v14    # "minUpdateTimeMs":J
    :cond_5
    const-wide v16, -0x7fffffffffffffffL    # -4.9E-324

    goto :goto_2

    .line 117
    .restart local v16    # "timeShiftBufferDepthMs":J
    :cond_6
    const-wide v18, -0x7fffffffffffffffL    # -4.9E-324

    goto :goto_3

    .line 122
    .restart local v18    # "suggestedPresentationDelayMs":J
    .restart local v20    # "utcTiming":Lcom/google/android/exoplayer2/source/dash/manifest/UtcTimingElement;
    .restart local v21    # "location":Landroid/net/Uri;
    .restart local v22    # "periods":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/Period;>;"
    :cond_7
    const-wide/16 v24, 0x0

    goto :goto_4

    .line 132
    .restart local v24    # "nextPeriodStartMs":J
    .restart local v29    # "seenEarlyAccessPeriod":Z
    .restart local v30    # "seenFirstBaseUrl":Z
    :cond_8
    const-string/jumbo v6, "UTCTiming"

    move-object/from16 v0, p1

    invoke-static {v0, v6}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 133
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseUtcTiming(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer2/source/dash/manifest/UtcTimingElement;

    move-result-object v20

    goto :goto_5

    .line 134
    :cond_9
    const-string/jumbo v6, "Location"

    move-object/from16 v0, p1

    invoke-static {v0, v6}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 135
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v21

    goto :goto_5

    .line 136
    :cond_a
    const-string/jumbo v6, "Period"

    move-object/from16 v0, p1

    invoke-static {v0, v6}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    if-nez v29, :cond_1

    .line 137
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-wide/from16 v3, v24

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parsePeriod(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)Landroid/util/Pair;

    move-result-object v28

    .line 138
    .local v28, "periodWithDurationMs":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/google/android/exoplayer2/source/dash/manifest/Period;Ljava/lang/Long;>;"
    move-object/from16 v0, v28

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    move-object/from16 v23, v0

    check-cast v23, Lcom/google/android/exoplayer2/source/dash/manifest/Period;

    .line 139
    .local v23, "period":Lcom/google/android/exoplayer2/source/dash/manifest/Period;
    move-object/from16 v0, v23

    iget-wide v0, v0, Lcom/google/android/exoplayer2/source/dash/manifest/Period;->startMs:J

    move-wide/from16 v32, v0

    const-wide v34, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v6, v32, v34

    if-nez v6, :cond_c

    .line 140
    if-eqz v13, :cond_b

    .line 143
    const/16 v29, 0x1

    goto/16 :goto_5

    .line 145
    :cond_b
    new-instance v6, Lcom/google/android/exoplayer2/ParserException;

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v33, "Unable to determine start of period "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-interface/range {v22 .. v22}, Ljava/util/List;->size()I

    move-result v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-direct {v6, v0}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 148
    :cond_c
    move-object/from16 v0, v28

    iget-object v6, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v26

    .line 149
    .local v26, "periodDurationMs":J
    const-wide v32, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v6, v26, v32

    if-nez v6, :cond_d

    const-wide v24, -0x7fffffffffffffffL    # -4.9E-324

    .line 151
    :goto_6
    invoke-interface/range {v22 .. v23}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_5

    .line 149
    :cond_d
    move-object/from16 v0, v23

    iget-wide v0, v0, Lcom/google/android/exoplayer2/source/dash/manifest/Period;->startMs:J

    move-wide/from16 v32, v0

    add-long v24, v32, v26

    goto :goto_6

    .line 160
    .end local v23    # "period":Lcom/google/android/exoplayer2/source/dash/manifest/Period;
    .end local v26    # "periodDurationMs":J
    .end local v28    # "periodWithDurationMs":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/google/android/exoplayer2/source/dash/manifest/Period;Ljava/lang/Long;>;"
    :cond_e
    if-nez v13, :cond_2

    .line 161
    new-instance v6, Lcom/google/android/exoplayer2/ParserException;

    const-string/jumbo v32, "Unable to determine duration of static manifest."

    move-object/from16 v0, v32

    invoke-direct {v6, v0}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v6

    :cond_f
    move-object/from16 v6, p0

    .line 169
    invoke-virtual/range {v6 .. v22}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->buildMediaPresentationDescription(JJJZJJJLcom/google/android/exoplayer2/source/dash/manifest/UtcTimingElement;Landroid/net/Uri;Ljava/util/List;)Lcom/google/android/exoplayer2/source/dash/manifest/DashManifest;

    move-result-object v6

    return-object v6
.end method

.method protected parsePeriod(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)Landroid/util/Pair;
    .locals 17
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "baseUrl"    # Ljava/lang/String;
    .param p3, "defaultStartMs"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            "Ljava/lang/String;",
            "J)",
            "Landroid/util/Pair",
            "<",
            "Lcom/google/android/exoplayer2/source/dash/manifest/Period;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 195
    const/4 v12, 0x0

    const-string/jumbo v13, "id"

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 196
    .local v5, "id":Ljava/lang/String;
    const-string/jumbo v12, "start"

    move-object/from16 v0, p1

    move-wide/from16 v1, p3

    invoke-static {v0, v12, v1, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseDuration(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v10

    .line 197
    .local v10, "startMs":J
    const-string/jumbo v12, "duration"

    const-wide v14, -0x7fffffffffffffffL    # -4.9E-324

    move-object/from16 v0, p1

    invoke-static {v0, v12, v14, v15}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseDuration(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v6

    .line 198
    .local v6, "durationMs":J
    const/4 v9, 0x0

    .line 199
    .local v9, "segmentBase":Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 200
    .local v4, "adaptationSets":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;>;"
    const/4 v8, 0x0

    .line 202
    .local v8, "seenFirstBaseUrl":Z
    :cond_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 203
    const-string/jumbo v12, "BaseURL"

    move-object/from16 v0, p1

    invoke-static {v0, v12}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 204
    if-nez v8, :cond_1

    .line 205
    invoke-static/range {p1 .. p2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseBaseUrl(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 206
    const/4 v8, 0x1

    .line 217
    :cond_1
    :goto_0
    const-string/jumbo v12, "Period"

    move-object/from16 v0, p1

    invoke-static {v0, v12}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 219
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v10, v11, v4}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->buildPeriod(Ljava/lang/String;JLjava/util/List;)Lcom/google/android/exoplayer2/source/dash/manifest/Period;

    move-result-object v12

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v12

    return-object v12

    .line 208
    :cond_2
    const-string/jumbo v12, "AdaptationSet"

    move-object/from16 v0, p1

    invoke-static {v0, v12}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 209
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2, v9}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseAdaptationSet(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;)Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;

    move-result-object v12

    invoke-interface {v4, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 210
    :cond_3
    const-string/jumbo v12, "SegmentBase"

    move-object/from16 v0, p1

    invoke-static {v0, v12}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 211
    const/4 v12, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v12}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseSegmentBase(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;

    move-result-object v9

    goto :goto_0

    .line 212
    :cond_4
    const-string/jumbo v12, "SegmentList"

    move-object/from16 v0, p1

    invoke-static {v0, v12}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 213
    const/4 v12, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v12}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseSegmentList(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;

    move-result-object v9

    goto :goto_0

    .line 214
    :cond_5
    const-string/jumbo v12, "SegmentTemplate"

    move-object/from16 v0, p1

    invoke-static {v0, v12}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 215
    const/4 v12, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v12}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseSegmentTemplate(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;

    move-result-object v9

    goto :goto_0
.end method

.method protected parseRangedUrl(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .locals 12
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "urlAttribute"    # Ljava/lang/String;
    .param p3, "rangeAttribute"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 683
    invoke-interface {p1, v0, p2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 684
    .local v1, "urlText":Ljava/lang/String;
    const-wide/16 v2, 0x0

    .line 685
    .local v2, "rangeStart":J
    const-wide/16 v4, -0x1

    .line 686
    .local v4, "rangeLength":J
    invoke-interface {p1, v0, p3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 687
    .local v6, "rangeText":Ljava/lang/String;
    if-eqz v6, :cond_0

    .line 688
    const-string/jumbo v0, "-"

    invoke-virtual {v6, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 689
    .local v7, "rangeTextArray":[Ljava/lang/String;
    const/4 v0, 0x0

    aget-object v0, v7, v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 690
    array-length v0, v7

    const/4 v8, 0x2

    if-ne v0, v8, :cond_0

    .line 691
    const/4 v0, 0x1

    aget-object v0, v7, v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    sub-long/2addr v8, v2

    const-wide/16 v10, 0x1

    add-long v4, v8, v10

    .end local v7    # "rangeTextArray":[Ljava/lang/String;
    :cond_0
    move-object v0, p0

    .line 694
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->buildRangedUri(Ljava/lang/String;JJ)Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    move-result-object v0

    return-object v0
.end method

.method protected parseRepresentation(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIFIILjava/lang/String;ILjava/util/List;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;)Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;
    .locals 24
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "baseUrl"    # Ljava/lang/String;
    .param p3, "adaptationSetMimeType"    # Ljava/lang/String;
    .param p4, "adaptationSetCodecs"    # Ljava/lang/String;
    .param p5, "adaptationSetWidth"    # I
    .param p6, "adaptationSetHeight"    # I
    .param p7, "adaptationSetFrameRate"    # F
    .param p8, "adaptationSetAudioChannels"    # I
    .param p9, "adaptationSetAudioSamplingRate"    # I
    .param p10, "adaptationSetLanguage"    # Ljava/lang/String;
    .param p11, "adaptationSetSelectionFlags"    # I
    .param p13, "segmentBase"    # Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "IIFII",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;",
            ">;",
            "Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;",
            ")",
            "Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 429
    .local p12, "adaptationSetAccessibilityDescriptors":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;>;"
    const/4 v3, 0x0

    const-string/jumbo v12, "id"

    move-object/from16 v0, p1

    invoke-interface {v0, v3, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 430
    .local v4, "id":Ljava/lang/String;
    const-string/jumbo v3, "bandwidth"

    const/4 v12, -0x1

    move-object/from16 v0, p1

    invoke-static {v0, v3, v12}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v11

    .line 432
    .local v11, "bandwidth":I
    const-string/jumbo v3, "mimeType"

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-static {v0, v3, v1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseString(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 433
    .local v5, "mimeType":Ljava/lang/String;
    const-string/jumbo v3, "codecs"

    move-object/from16 v0, p1

    move-object/from16 v1, p4

    invoke-static {v0, v3, v1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseString(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 434
    .local v15, "codecs":Ljava/lang/String;
    const-string/jumbo v3, "width"

    move-object/from16 v0, p1

    move/from16 v1, p5

    invoke-static {v0, v3, v1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v6

    .line 435
    .local v6, "width":I
    const-string/jumbo v3, "height"

    move-object/from16 v0, p1

    move/from16 v1, p6

    invoke-static {v0, v3, v1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v7

    .line 436
    .local v7, "height":I
    move-object/from16 v0, p1

    move/from16 v1, p7

    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseFrameRate(Lorg/xmlpull/v1/XmlPullParser;F)F

    move-result v8

    .line 437
    .local v8, "frameRate":F
    move/from16 v9, p8

    .line 438
    .local v9, "audioChannels":I
    const-string/jumbo v3, "audioSamplingRate"

    move-object/from16 v0, p1

    move/from16 v1, p9

    invoke-static {v0, v3, v1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v10

    .line 439
    .local v10, "audioSamplingRate":I
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 440
    .local v20, "drmSchemeDatas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;>;"
    new-instance v21, Ljava/util/ArrayList;

    invoke-direct/range {v21 .. v21}, Ljava/util/ArrayList;-><init>()V

    .line 442
    .local v21, "inbandEventStreams":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;>;"
    const/16 v23, 0x0

    .line 444
    .local v23, "seenFirstBaseUrl":Z
    :cond_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 445
    const-string/jumbo v3, "BaseURL"

    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 446
    if-nez v23, :cond_1

    .line 447
    invoke-static/range {p1 .. p2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseBaseUrl(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 448
    const/16 v23, 0x1

    .line 466
    :cond_1
    :goto_0
    const-string/jumbo v3, "Representation"

    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    move-object/from16 v3, p0

    move-object/from16 v12, p10

    move/from16 v13, p11

    move-object/from16 v14, p12

    .line 468
    invoke-virtual/range {v3 .. v15}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->buildFormat(Ljava/lang/String;Ljava/lang/String;IIFIIILjava/lang/String;ILjava/util/List;Ljava/lang/String;)Lcom/google/android/exoplayer2/Format;

    move-result-object v17

    .line 471
    .local v17, "format":Lcom/google/android/exoplayer2/Format;
    if-eqz p13, :cond_8

    .line 473
    :goto_1
    new-instance v16, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;

    move-object/from16 v18, p2

    move-object/from16 v19, p13

    invoke-direct/range {v16 .. v21}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser$RepresentationInfo;-><init>(Lcom/google/android/exoplayer2/Format;Ljava/lang/String;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    return-object v16

    .line 450
    .end local v17    # "format":Lcom/google/android/exoplayer2/Format;
    :cond_2
    const-string/jumbo v3, "AudioChannelConfiguration"

    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 451
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseAudioChannelConfiguration(Lorg/xmlpull/v1/XmlPullParser;)I

    move-result v9

    goto :goto_0

    .line 452
    :cond_3
    const-string/jumbo v3, "SegmentBase"

    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 453
    check-cast p13, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;

    .end local p13    # "segmentBase":Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p13

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseSegmentBase(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;

    move-result-object p13

    .restart local p13    # "segmentBase":Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;
    goto :goto_0

    .line 454
    :cond_4
    const-string/jumbo v3, "SegmentList"

    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 455
    check-cast p13, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;

    .end local p13    # "segmentBase":Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p13

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseSegmentList(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;

    move-result-object p13

    .restart local p13    # "segmentBase":Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;
    goto :goto_0

    .line 456
    :cond_5
    const-string/jumbo v3, "SegmentTemplate"

    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 457
    check-cast p13, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;

    .end local p13    # "segmentBase":Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p13

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseSegmentTemplate(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;

    move-result-object p13

    .restart local p13    # "segmentBase":Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;
    goto :goto_0

    .line 458
    :cond_6
    const-string/jumbo v3, "ContentProtection"

    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 459
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseContentProtection(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;

    move-result-object v22

    .line 460
    .local v22, "contentProtection":Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;
    if-eqz v22, :cond_1

    .line 461
    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 463
    .end local v22    # "contentProtection":Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;
    :cond_7
    const-string/jumbo v3, "InbandEventStream"

    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 464
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseInbandEventStream(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;

    move-result-object v3

    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 471
    .restart local v17    # "format":Lcom/google/android/exoplayer2/Format;
    :cond_8
    new-instance p13, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;

    .end local p13    # "segmentBase":Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;
    invoke-direct/range {p13 .. p13}, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;-><init>()V

    goto/16 :goto_1
.end method

.method protected parseRole(Lorg/xmlpull/v1/XmlPullParser;)I
    .locals 4
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 399
    const-string/jumbo v2, "schemeIdUri"

    invoke-static {p1, v2, v3}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseString(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 400
    .local v0, "schemeIdUri":Ljava/lang/String;
    const-string/jumbo v2, "value"

    invoke-static {p1, v2, v3}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseString(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 402
    .local v1, "value":Ljava/lang/String;
    :cond_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 403
    const-string/jumbo v2, "Role"

    invoke-static {p1, v2}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 404
    const-string/jumbo v2, "urn:mpeg:dash:role:2011"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string/jumbo v2, "main"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method protected parseSegmentBase(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;
    .locals 18
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "parent"    # Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 525
    const-string/jumbo v2, "timescale"

    if-eqz p2, :cond_3

    move-object/from16 v0, p2

    iget-wide v14, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;->timescale:J

    :goto_0
    move-object/from16 v0, p1

    invoke-static {v0, v2, v14, v15}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v4

    .line 526
    .local v4, "timescale":J
    const-string/jumbo v2, "presentationTimeOffset"

    if-eqz p2, :cond_4

    move-object/from16 v0, p2

    iget-wide v14, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;->presentationTimeOffset:J

    :goto_1
    move-object/from16 v0, p1

    invoke-static {v0, v2, v14, v15}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v6

    .line 529
    .local v6, "presentationTimeOffset":J
    if-eqz p2, :cond_5

    move-object/from16 v0, p2

    iget-wide v8, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;->indexStart:J

    .line 530
    .local v8, "indexStart":J
    :goto_2
    if-eqz p2, :cond_6

    move-object/from16 v0, p2

    iget-wide v10, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;->indexLength:J

    .line 531
    .local v10, "indexLength":J
    :goto_3
    const/4 v2, 0x0

    const-string/jumbo v14, "indexRange"

    move-object/from16 v0, p1

    invoke-interface {v0, v2, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 532
    .local v13, "indexRangeText":Ljava/lang/String;
    if-eqz v13, :cond_0

    .line 533
    const-string/jumbo v2, "-"

    invoke-virtual {v13, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    .line 534
    .local v12, "indexRange":[Ljava/lang/String;
    const/4 v2, 0x0

    aget-object v2, v12, v2

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    .line 535
    const/4 v2, 0x1

    aget-object v2, v12, v2

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v14

    sub-long/2addr v14, v8

    const-wide/16 v16, 0x1

    add-long v10, v14, v16

    .line 538
    .end local v12    # "indexRange":[Ljava/lang/String;
    :cond_0
    if-eqz p2, :cond_7

    move-object/from16 v0, p2

    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;->initialization:Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    .line 540
    .local v3, "initialization":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    :cond_1
    :goto_4
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 541
    const-string/jumbo v2, "Initialization"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 542
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseInitialization(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    move-result-object v3

    .line 544
    :cond_2
    const-string/jumbo v2, "SegmentBase"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    move-object/from16 v2, p0

    .line 546
    invoke-virtual/range {v2 .. v11}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->buildSingleSegmentBase(Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;JJJJ)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;

    move-result-object v2

    return-object v2

    .line 525
    .end local v3    # "initialization":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .end local v4    # "timescale":J
    .end local v6    # "presentationTimeOffset":J
    .end local v8    # "indexStart":J
    .end local v10    # "indexLength":J
    .end local v13    # "indexRangeText":Ljava/lang/String;
    :cond_3
    const-wide/16 v14, 0x1

    goto :goto_0

    .line 526
    .restart local v4    # "timescale":J
    :cond_4
    const-wide/16 v14, 0x0

    goto :goto_1

    .line 529
    .restart local v6    # "presentationTimeOffset":J
    :cond_5
    const-wide/16 v8, 0x0

    goto :goto_2

    .line 530
    .restart local v8    # "indexStart":J
    :cond_6
    const-wide/16 v10, 0x0

    goto :goto_3

    .line 538
    .restart local v10    # "indexLength":J
    .restart local v13    # "indexRangeText":Ljava/lang/String;
    :cond_7
    const/4 v3, 0x0

    goto :goto_4
.end method

.method protected parseSegmentList(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;
    .locals 16
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "parent"    # Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 559
    const-string/jumbo v2, "timescale"

    if-eqz p2, :cond_3

    move-object/from16 v0, p2

    iget-wide v14, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;->timescale:J

    :goto_0
    move-object/from16 v0, p1

    invoke-static {v0, v2, v14, v15}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v4

    .line 560
    .local v4, "timescale":J
    const-string/jumbo v2, "presentationTimeOffset"

    if-eqz p2, :cond_4

    move-object/from16 v0, p2

    iget-wide v14, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;->presentationTimeOffset:J

    :goto_1
    move-object/from16 v0, p1

    invoke-static {v0, v2, v14, v15}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v6

    .line 562
    .local v6, "presentationTimeOffset":J
    const-string/jumbo v2, "duration"

    if-eqz p2, :cond_5

    move-object/from16 v0, p2

    iget-wide v14, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;->duration:J

    :goto_2
    move-object/from16 v0, p1

    invoke-static {v0, v2, v14, v15}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v9

    .line 563
    .local v9, "duration":J
    const-string/jumbo v13, "startNumber"

    if-eqz p2, :cond_6

    move-object/from16 v0, p2

    iget v2, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;->startNumber:I

    :goto_3
    move-object/from16 v0, p1

    invoke-static {v0, v13, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v8

    .line 565
    .local v8, "startNumber":I
    const/4 v3, 0x0

    .line 566
    .local v3, "initialization":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    const/4 v11, 0x0

    .line 567
    .local v11, "timeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTimelineElement;>;"
    const/4 v12, 0x0

    .line 570
    .local v12, "segments":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;>;"
    :cond_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 571
    const-string/jumbo v2, "Initialization"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 572
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseInitialization(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    move-result-object v3

    .line 581
    :cond_1
    :goto_4
    const-string/jumbo v2, "SegmentList"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 583
    if-eqz p2, :cond_2

    .line 584
    if-eqz v3, :cond_a

    .line 585
    :goto_5
    if-eqz v11, :cond_b

    .line 586
    :goto_6
    if-eqz v12, :cond_c

    :cond_2
    :goto_7
    move-object/from16 v2, p0

    .line 589
    invoke-virtual/range {v2 .. v12}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->buildSegmentList(Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;JJIJLjava/util/List;Ljava/util/List;)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;

    move-result-object v2

    return-object v2

    .line 559
    .end local v3    # "initialization":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .end local v4    # "timescale":J
    .end local v6    # "presentationTimeOffset":J
    .end local v8    # "startNumber":I
    .end local v9    # "duration":J
    .end local v11    # "timeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTimelineElement;>;"
    .end local v12    # "segments":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;>;"
    :cond_3
    const-wide/16 v14, 0x1

    goto :goto_0

    .line 560
    .restart local v4    # "timescale":J
    :cond_4
    const-wide/16 v14, 0x0

    goto :goto_1

    .line 562
    .restart local v6    # "presentationTimeOffset":J
    :cond_5
    const-wide v14, -0x7fffffffffffffffL    # -4.9E-324

    goto :goto_2

    .line 563
    .restart local v9    # "duration":J
    :cond_6
    const/4 v2, 0x1

    goto :goto_3

    .line 573
    .restart local v3    # "initialization":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .restart local v8    # "startNumber":I
    .restart local v11    # "timeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTimelineElement;>;"
    .restart local v12    # "segments":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;>;"
    :cond_7
    const-string/jumbo v2, "SegmentTimeline"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 574
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseSegmentTimeline(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/List;

    move-result-object v11

    goto :goto_4

    .line 575
    :cond_8
    const-string/jumbo v2, "SegmentURL"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 576
    if-nez v12, :cond_9

    .line 577
    new-instance v12, Ljava/util/ArrayList;

    .end local v12    # "segments":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;>;"
    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 579
    .restart local v12    # "segments":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;>;"
    :cond_9
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseSegmentUrl(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    move-result-object v2

    invoke-interface {v12, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 584
    :cond_a
    move-object/from16 v0, p2

    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;->initialization:Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    goto :goto_5

    .line 585
    :cond_b
    move-object/from16 v0, p2

    iget-object v11, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;->segmentTimeline:Ljava/util/List;

    goto :goto_6

    .line 586
    :cond_c
    move-object/from16 v0, p2

    iget-object v12, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentList;->mediaSegments:Ljava/util/List;

    goto :goto_7
.end method

.method protected parseSegmentTemplate(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;
    .locals 16
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "parent"    # Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 602
    const-string/jumbo v2, "timescale"

    if-eqz p2, :cond_3

    move-object/from16 v0, p2

    iget-wide v14, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;->timescale:J

    :goto_0
    move-object/from16 v0, p1

    invoke-static {v0, v2, v14, v15}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v4

    .line 603
    .local v4, "timescale":J
    const-string/jumbo v2, "presentationTimeOffset"

    if-eqz p2, :cond_4

    move-object/from16 v0, p2

    iget-wide v14, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;->presentationTimeOffset:J

    :goto_1
    move-object/from16 v0, p1

    invoke-static {v0, v2, v14, v15}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v6

    .line 605
    .local v6, "presentationTimeOffset":J
    const-string/jumbo v2, "duration"

    if-eqz p2, :cond_5

    move-object/from16 v0, p2

    iget-wide v14, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;->duration:J

    :goto_2
    move-object/from16 v0, p1

    invoke-static {v0, v2, v14, v15}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v9

    .line 606
    .local v9, "duration":J
    const-string/jumbo v14, "startNumber"

    if-eqz p2, :cond_6

    move-object/from16 v0, p2

    iget v2, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;->startNumber:I

    :goto_3
    move-object/from16 v0, p1

    invoke-static {v0, v14, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v8

    .line 607
    .local v8, "startNumber":I
    const-string/jumbo v14, "media"

    if-eqz p2, :cond_7

    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;->mediaTemplate:Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;

    :goto_4
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v14, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseUrlTemplate(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;)Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;

    move-result-object v13

    .line 609
    .local v13, "mediaTemplate":Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;
    const-string/jumbo v14, "initialization"

    if-eqz p2, :cond_8

    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;->initializationTemplate:Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;

    :goto_5
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v14, v2}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseUrlTemplate(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;)Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;

    move-result-object v12

    .line 612
    .local v12, "initializationTemplate":Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;
    const/4 v3, 0x0

    .line 613
    .local v3, "initialization":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    const/4 v11, 0x0

    .line 616
    .local v11, "timeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTimelineElement;>;"
    :cond_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 617
    const-string/jumbo v2, "Initialization"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 618
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseInitialization(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    move-result-object v3

    .line 622
    :cond_1
    :goto_6
    const-string/jumbo v2, "SegmentTemplate"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 624
    if-eqz p2, :cond_2

    .line 625
    if-eqz v3, :cond_a

    .line 626
    :goto_7
    if-eqz v11, :cond_b

    :cond_2
    :goto_8
    move-object/from16 v2, p0

    .line 629
    invoke-virtual/range {v2 .. v13}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->buildSegmentTemplate(Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;JJIJLjava/util/List;Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;

    move-result-object v2

    return-object v2

    .line 602
    .end local v3    # "initialization":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .end local v4    # "timescale":J
    .end local v6    # "presentationTimeOffset":J
    .end local v8    # "startNumber":I
    .end local v9    # "duration":J
    .end local v11    # "timeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTimelineElement;>;"
    .end local v12    # "initializationTemplate":Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;
    .end local v13    # "mediaTemplate":Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;
    :cond_3
    const-wide/16 v14, 0x1

    goto/16 :goto_0

    .line 603
    .restart local v4    # "timescale":J
    :cond_4
    const-wide/16 v14, 0x0

    goto :goto_1

    .line 605
    .restart local v6    # "presentationTimeOffset":J
    :cond_5
    const-wide v14, -0x7fffffffffffffffL    # -4.9E-324

    goto :goto_2

    .line 606
    .restart local v9    # "duration":J
    :cond_6
    const/4 v2, 0x1

    goto :goto_3

    .line 607
    .restart local v8    # "startNumber":I
    :cond_7
    const/4 v2, 0x0

    goto :goto_4

    .line 609
    .restart local v13    # "mediaTemplate":Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;
    :cond_8
    const/4 v2, 0x0

    goto :goto_5

    .line 619
    .restart local v3    # "initialization":Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .restart local v11    # "timeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTimelineElement;>;"
    .restart local v12    # "initializationTemplate":Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;
    :cond_9
    const-string/jumbo v2, "SegmentTimeline"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 620
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseSegmentTimeline(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/List;

    move-result-object v11

    goto :goto_6

    .line 625
    :cond_a
    move-object/from16 v0, p2

    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;->initialization:Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    goto :goto_7

    .line 626
    :cond_b
    move-object/from16 v0, p2

    iget-object v11, v0, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTemplate;->segmentTimeline:Ljava/util/List;

    goto :goto_8
.end method

.method protected parseSegmentTimeline(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/List;
    .locals 10
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTimelineElement;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 643
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 644
    .local v6, "segmentTimeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTimelineElement;>;"
    const-wide/16 v4, 0x0

    .line 646
    .local v4, "elapsedTime":J
    :cond_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 647
    const-string/jumbo v7, "S"

    invoke-static {p1, v7}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 648
    const-string/jumbo v7, "t"

    invoke-static {p1, v7, v4, v5}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v4

    .line 649
    const-string/jumbo v7, "d"

    const-wide v8, -0x7fffffffffffffffL    # -4.9E-324

    invoke-static {p1, v7, v8, v9}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v2

    .line 650
    .local v2, "duration":J
    const-string/jumbo v7, "r"

    const/4 v8, 0x0

    invoke-static {p1, v7, v8}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v7

    add-int/lit8 v0, v7, 0x1

    .line 651
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 652
    invoke-virtual {p0, v4, v5, v2, v3}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->buildSegmentTimelineElement(JJ)Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SegmentTimelineElement;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 653
    add-long/2addr v4, v2

    .line 651
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 656
    .end local v0    # "count":I
    .end local v1    # "i":I
    .end local v2    # "duration":J
    :cond_1
    const-string/jumbo v7, "SegmentTimeline"

    invoke-static {p1, v7}, Lcom/google/android/exoplayer2/util/XmlPullParserUtil;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 657
    return-object v6
.end method

.method protected parseSegmentUrl(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .locals 2
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    .line 678
    const-string/jumbo v0, "media"

    const-string/jumbo v1, "mediaRange"

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->parseRangedUrl(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    move-result-object v0

    return-object v0
.end method

.method protected parseUrlTemplate(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;)Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;
    .locals 2
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "defaultValue"    # Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;

    .prologue
    .line 666
    const/4 v1, 0x0

    invoke-interface {p1, v1, p2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 667
    .local v0, "valueString":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 668
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;->compile(Ljava/lang/String;)Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;

    move-result-object p3

    .line 670
    .end local p3    # "defaultValue":Lcom/google/android/exoplayer2/source/dash/manifest/UrlTemplate;
    :cond_0
    return-object p3
.end method

.method protected parseUtcTiming(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer2/source/dash/manifest/UtcTimingElement;
    .locals 4
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    const/4 v3, 0x0

    .line 184
    const-string/jumbo v2, "schemeIdUri"

    invoke-interface {p1, v3, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 185
    .local v0, "schemeIdUri":Ljava/lang/String;
    const-string/jumbo v2, "value"

    invoke-interface {p1, v3, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 186
    .local v1, "value":Ljava/lang/String;
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer2/source/dash/manifest/DashManifestParser;->buildUtcTimingElement(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/exoplayer2/source/dash/manifest/UtcTimingElement;

    move-result-object v2

    return-object v2
.end method
