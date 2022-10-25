package org.mp4parser.aspectj.internal.lang.reflect;

import java.util.StringTokenizer;
import org.mp4parser.aspectj.lang.reflect.AjType;
import org.mp4parser.aspectj.lang.reflect.DeclarePrecedence;
import org.mp4parser.aspectj.lang.reflect.TypePattern;
/* loaded from: classes3.dex */
public class DeclarePrecedenceImpl implements DeclarePrecedence {
    private AjType<?> declaringType;
    private TypePattern[] precedenceList;
    private String precedenceString;

    public DeclarePrecedenceImpl(String precedenceList, AjType declaring) {
        this.declaringType = declaring;
        this.precedenceString = precedenceList;
        String toTokenize = precedenceList;
        StringTokenizer strTok = new StringTokenizer(toTokenize.startsWith("(") ? toTokenize.substring(1, toTokenize.length() - 1) : toTokenize, ",");
        this.precedenceList = new TypePattern[strTok.countTokens()];
        for (int i = 0; i < this.precedenceList.length; i++) {
            this.precedenceList[i] = new TypePatternImpl(strTok.nextToken().trim());
        }
    }

    @Override // org.mp4parser.aspectj.lang.reflect.DeclarePrecedence
    public AjType getDeclaringType() {
        return this.declaringType;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.DeclarePrecedence
    public TypePattern[] getPrecedenceOrder() {
        return this.precedenceList;
    }

    public String toString() {
        return "declare precedence : " + this.precedenceString;
    }
}
